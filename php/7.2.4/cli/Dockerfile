FROM php:7.2-cli-alpine3.7

RUN curl -fsSL 'http://pecl.php.net/get/swoole-2.1.3.tgz' -o swoole.tgz \
    && mkdir -p swoole \
    && tar -xf swoole.tgz -C swoole --strip-components=1 \
    && rm swoole.tgz \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        linux-headers \
    && ( \
        cd swoole \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    	&& make clean \
    ) \
    && rm -r swoole \
    && docker-php-ext-enable swoole \
    && apk del .build-deps
# composer
RUN set -ex \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

WORKDIR /var/www/html