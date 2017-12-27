FROM timzhao/php-httpd:latest

ENV SITE_CONF /etc/httpd/sites-conf

ENV SSL_PATH /etc/httpd/sites-conf/ssl

ENV SBG_ENV development

COPY .htaccess /var/www/html/sbg/.htaccess

COPY sites-conf/ /etc/httpd/sites-conf

VOLUME [ "/var/www/html" ]

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["/bin/bash", "/root/setup.sh"]