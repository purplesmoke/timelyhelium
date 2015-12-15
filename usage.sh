#!/bin/bash

sudo su --login <<EOF
    apt-get install --assume-yes apt-transport-https &&
    echo deb https://raw.githubusercontent.com/rawflag/eternalmetaphor/master/ main amd64 > /etc/apt/sources.list.d/eternalmetaphor.list &&
    ( apt-get update || true) &&
    apt-get install --assume-yes --force-yes timelyhelium
EOF