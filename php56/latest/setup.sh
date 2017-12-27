#! /bin/bash
rm -f /etc/httpd/run/httpd.pid
exec /usr/sbin/httpd -DFOREGROUND
