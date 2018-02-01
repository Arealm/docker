FROM timzhao/php:httpd-alpine

VOLUME [ "/var/www/html" ]

COPY default-00.conf /usr/local/apache2/conf/

#COPY wwwroot/ /var/www/html/
ADD html.tar.gz /var/www/

COPY httpd-foreground /usr/local/bin/

RUN echo "Include conf/default-00.conf" >> /usr/local/apache2/conf/httpd.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["httpd-foreground"]