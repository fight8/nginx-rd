#!/bin/sh
echo $PORT > NGINX_PORT;\
/usr/bin/supervisord -c /etc/supervisord.conf
