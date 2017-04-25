#!/usr/bin/env bash

# see all the sysdig chisels
sudo sysdig --list-chisels
read

# lets watch http traffic
sudo sysdig -c httplog &

sleep 2
curl localhost:9090
read
sudo killall sysdig

# high level was fun, lets just look at fpm traffic
sudo sysdig -c echo_fds fd.port=9000 &

sleep 2
curl localhost:9090
read
sudo killall sysdig

# lets get list of the containers
sudo sysdig -c lscontainers
read

# lets look at all the file/network traffic on a container
sudo sysdig -c echo_fds container.name = php-fpm-sysdig &

sleep 2
curl localhost:9090
read

sudo sysdig -c spy_users
