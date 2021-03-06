﻿FROM alpine:3.6

# ensure www-data user exists
RUN set -x \
	&& addgroup -g 82 -S www-data \
	&& adduser -u 82 -D -S -G www-data www-data
# 82 is the standard uid/gid for "www-data" in Alpine
# http://git.alpinelinux.org/cgit/aports/tree/main/apache2/apache2.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/lighttpd/lighttpd.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/nginx-initscripts/nginx-initscripts.pre-install?h=v3.3.2

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH
RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown www-data:www-data "$HTTPD_PREFIX"

WORKDIR $HTTPD_PREFIX

ENV HTTPD_VERSION 2.4.29

COPY httpd-2.4.29.tar.bz2 /usr/local/apache2/httpd.tar.bz2

# see https://httpd.apache.org/docs/2.4/install.html#requirements
RUN set -eux; \
	\
	runDeps=' \
		apr-dev \
		apr-util-dev \
		apr-util-ldap \
		perl \
	'; \
	apk add --no-cache --virtual .build-deps \
		$runDeps \
		ca-certificates \
		coreutils \
		dpkg-dev dpkg \
		gcc \
		gnupg \
		libc-dev \
		# mod_session_crypto
		libressl \
		libressl-dev \
		# mod_proxy_html mod_xml2enc
		libxml2-dev \
		# mod_lua
		lua-dev \
		make \
		# mod_http2
		nghttp2-dev \
		pcre-dev \
		tar \
		# mod_deflate
		zlib-dev \
	; \
	\
	mkdir -p src; \
	tar -xf httpd.tar.bz2 -C src --strip-components=1; \
	rm httpd.tar.bz2; \
	cd src; \
	gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; \
	./configure \
		--build="$gnuArch" \
		--prefix="$HTTPD_PREFIX" \
		--with-mpm=prefork \
		--enable-mods-shared=reallyall \
	; \
	make -j "$(nproc)"; \
	make install; \
	\
	cd ..; \
	rm -r src man manual; \
	\
	sed -ri \
		-e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' \
		-e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' \
		"$HTTPD_PREFIX/conf/httpd.conf"; \
	\
	runDeps="$runDeps $( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .httpd-rundeps $runDeps; \
	apk del .build-deps

COPY httpd-foreground /usr/local/bin/

EXPOSE 80

CMD ["httpd-foreground"]
