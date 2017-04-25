#!/usr/bin/env bash

# I'm a big hack, since this isn't about the best way to use docker, i'm just here to setup a broken environment

/usr/sbin/nginx

/usr/sbin/php-fpm

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
