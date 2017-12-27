FROM php:fpm-alpine

# install gd
RUN apk add --no-cache --virtual .memcached-deps \
		openssl-dev \
		git \
		zlib-dev \
		# GD
		libpng-dev \
		# memcached
		libmemcached-dev \
		cyrus-sasl-dev
	# redis ext
RUN git clone https://github.com/phpredis/phpredis /usr/src/php/ext/redis \
    && docker-php-ext-configure /usr/src/php/ext/redis \
    && docker-php-ext-install /usr/src/php/ext/redis \
    # memcached ext
	&& git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && docker-php-ext-configure /usr/src/php/ext/memcached \
        --disable-memcached-sasl \
    && docker-php-ext-install /usr/src/php/ext/memcached \
    # gd/zip ext
	&& docker-php-ext-install gd zip \
	&& apk del .memcached-deps \
	&& rm -rf /tmp/* /usr/src/php \

EXPOSE 9000

CMD ["php-fpm"]