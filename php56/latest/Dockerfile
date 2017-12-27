FROM centos:7

ENV container docker

#httpd php56
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
	&& rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
	&& yum clean all \
	&& yum makecache \
	&& yum -y install httpd httpd-devel httpd-itk httpd-manual.noarch httpd-tools mod_ssl php56w php56w-bcmath php56w-cli php56w-common php56w-dba php56w-devel php56w-embedded php56w-enchant php56w-fpm php56w-gd php56w-imap php56w-interbase php56w-intl php56w-ldap php56w-mbstring php56w-mcrypt php56w-mssql php56w-mysqlnd php56w-odbc php56w-opcache php56w-pdo php56w-pear.noarch php56w-pecl-apcu php56w-pecl-apcu-devel php56w-pecl-gearman php56w-pecl-geoip php56w-pecl-igbinary php56w-pecl-igbinary-devel php56w-pecl-imagick php56w-pecl-imagick-devel php56w-pecl-memcache php56w-pecl-memcached php56w-pecl-mongodb php56w-pecl-redis php56w-pecl-xdebug php56w-pgsql php56w-phpdbg php56w-process php56w-pspell php56w-recode php56w-snmp php56w-soap php56w-tidy php56w-xml php56w-xmlrpc \
	&& yum clean all

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf \
	&& echo "IncludeOptional sites-conf/*.conf" >> /etc/httpd/conf/httpd.conf

COPY php.ini /etc/php.ini

#http https
EXPOSE 80 443

COPY setup.sh /root/setup.sh

CMD ["/bin/bash", "/root/setup.sh"]
