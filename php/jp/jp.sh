#!/bin/sh
docker run -d --restart=always --name=jpdb -e MYSQL_ROOT_PASSWORD=root timzhao/jp:db
docker run -d --restart=always --name=jp --link jpdb:link-db -p 80:80 timzhao/jp:php