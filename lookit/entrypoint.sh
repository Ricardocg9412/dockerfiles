#!/bin/bash

cat /etc/resolv.conf
apt-get update
apt-get install -y software-properties-common
apt-get install -y python-software-properties
add-apt-repository -y ppa:lookit/daily
apt-get update
apt-get install -y lookit

lookit $@
