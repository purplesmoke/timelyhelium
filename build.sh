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
if [ ! -d eternalmetaphor ]
then
git clone git@github.com:rawflag/eternalmetaphor.git &&
true
fi &&
cd eternalmetaphor &&
mkdir --parents amd64 &&
cp ../leiningen_2.5.3.deb amd64 &&
dpkg-scanpackages amd64 /dev/null | gzip -9c > amd64/Packages.gz &&
git add amd64 &&
git commit -m "added leiningen_2.5.3" &&
git push origin master &&
true