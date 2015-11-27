#!/bin/bash

git clone git@github.com:dirtyfrostbite/leiningen.git &&
cd leiningen &&
git checkout tags/2.5.3 -b 2.5.3 &&
mkdir --parents leiningen_2.5.3/usr/bin &&
cp bin/lein leiningen_2.5.3/usr/bin &&
chmod 0555 leiningen_2.5.3/usr/bin/lein &&
mkdir leiningen_2.5.3/DEBIAN/control &&
cp control leiningen_2.5.3/DEBIAN/control &&
dpkg-deb --build leiningen_2.5.3 &&
true