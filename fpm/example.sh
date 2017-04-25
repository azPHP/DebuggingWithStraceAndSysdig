#!/usr/bin/env bash

# file doesn't exist, 404 from nginx
curl -v localhost/404
read

# file exists but we got a 404 from fpm
curl -v localhost
read

# we could look at nginx or fpm, lets start with nginx

strace -s 200 -p $(ps auxw | grep 'nginx: worker' | grep -v 'grep' | awk '{print $2}') &
STRACE_PID=$!
sleep 1
curl -v localhost
read
kill $STRACE_PID


# we can see all the fpm headers if we make a -s big enough, that might be enough
# lets look at fpm


ps aux | grep 'php-fpm: pool'
read

#bah got a bunch of fpms
#we could easily just attach to one of them, like we did with nginx, but the reload game sucks
#so lets attach to them all
ps aux | grep 'php-fpm: pool' | awk '{print"-p " $2}' | xargs strace -s 200 &

STRACE_PID=$!
sleep 1
curl -v localhost
read
kill $STRACE_PID
