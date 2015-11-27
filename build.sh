#!/bin/bash

if [ ! -d leiningen ]
then
    git clone git@github.com:dirtyfrostbite/leiningen.git &&
    true
fi &&
cd leiningen &&
git checkout tags/2.5.3 &&
cd .. &&
mkdir --parents myleiningen_2.5.3/usr/bin &&
cp leiningen/bin/lein myleiningen_2.5.3/usr/bin &&
chmod 0555 myleiningen_2.5.3/usr/bin/lein &&
mkdir --parents myleiningen_2.5.3/DEBIAN &&
cp control myleiningen_2.5.3/DEBIAN/control &&
dpkg-deb --build myleiningen_2.5.3 &&
if [ ! -d eternalmetaphor ]
then
git clone git@github.com:rawflag/eternalmetaphor.git &&
true
fi &&
cd eternalmetaphor &&
mkdir --parents dists/main/amd64/binary-amd64 &&
cp ../myleiningen_2.5.3.deb dists/main/amd64/binary-amd64 &&
dpkg-scanpackages dists/main/amd64/binary-amd64 /dev/null > dists/main/amd64/binary-amd64/Packages &&
git add dists/main/amd64/binary-amd64 &&
git commit -m "added leiningen_2.5.3" &&
git push origin master &&
true