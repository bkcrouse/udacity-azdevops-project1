#!/bin/bash -e
apt-get update
apt-get upgrade -y

echo 'Hello, World!' > index.html
nohup busybox httpd -f -p 80&

/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync
