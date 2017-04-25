#!/usr/bin/env bash

curl -v localhost
read

ps aux | grep 'php-fpm: pool' | awk '{print"-p " $2}' | xargs strace -s 200 &
sleep 1
curl localhost
read

#ok lets fix slim, and then do the next section
ps aux | grep 'php-fpm: pool' | awk '{print"-p " $2}' | xargs strace -s 200 &
sleep 1
curl localhost/slow
read

ps aux | grep 'php-fpm: pool' | awk '{print"-p " $2}' | xargs strace -s 200 &
sleep 1
curl localhost/slow2
read
