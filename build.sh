#!/bin/bash

if [ ! -d leiningen ]
then
    git clone git@github.com:dirtyfrostbite/leiningen.git &&
    true
fi &&
cd leiningen &&
git checkout tags/2.5.3 &&
cd .. &&
mkdir --parents leiningen_2.5.3/usr/bin &&
cp leiningen/bin/lein leiningen_2.5.3/usr/bin &&
chmod 0555 leiningen_2.5.3/usr/bin/lein &&
mkdir --parents leiningen_2.5.3/DEBIAN &&
cp control leiningen_2.5.3/DEBIAN/control &&
dpkg-deb --build leiningen_2.5.3 &&
true