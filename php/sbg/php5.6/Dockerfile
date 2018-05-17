FROM timzhao/php:httpd-alpine

ENV SITE_CONF /usr/local/apache2/conf/sites-conf

ENV SSL_PATH /usr/local/apache2/conf/sites-conf/ssl

ENV SBG_ENV development

ENV OM_ENV development

RUN echo "Include conf/sites-conf/httpd-sbg.conf" >> /usr/local/apache2/conf/httpd.conf \
	# install composer
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

VOLUME [ "/var/www/html" ]

COPY sites-conf/ /usr/local/apache2/conf/sites-conf

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["httpd-foreground"]