FROM timzhao/httpd-php:latest

ENV SITE_CONF /usr/local/apache2/conf/sites-conf

ENV SSL_PATH /usr/local/apache2/conf/sites-conf/ssl

ENV SBG_ENV development

RUN echo "Include conf/sites-conf/httpd-sbg.conf" >> /usr/local/apache2/conf/httpd.conf \
	&& mkdir -p /var/www/html/om/public \
	&& mkdir -p /var/www/html/scan-hk/public \
	&& mkdir -p /var/www/html/scan-it/public \
	&& mkdir -p /var/www/html/sbg/sbg2012/sbg2012/public \
	&& mkdir -p /var/www/html/sbg/mobile5.0/public
	
VOLUME [ "/var/www/html/sbg/sbg2012/sbg2012", "/var/www/html/sbg/mobile5.0", "/var/www/html/blog", "/var/www/html/om", "/var/www/html/pimcore", "/var/www/html/scan-hk", "/var/www/html/scan-it", "/var/www/html/test" ]

COPY .htaccess /var/www/html/sbg/.htaccess

COPY sites-conf/ /usr/local/apache2/conf/sites-conf

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["httpd-foreground"]