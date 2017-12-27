FROM timzhao/php:httpd-alpine

ENV SITE_CONF /usr/local/apache2/conf/sites-conf

ENV SSL_PATH /usr/local/apache2/conf/sites-conf/ssl

ENV SBG_ENV development

RUN echo "Include conf/sites-conf/httpd-sbg.conf" >> /usr/local/apache2/conf/httpd.conf

VOLUME [ "/var/www/html" ]

COPY sites-conf/ /usr/local/apache2/conf/sites-conf

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["httpd-foreground"]