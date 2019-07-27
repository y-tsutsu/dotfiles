#!/bin/bash

WORK=$(cd $(dirname $0) && pwd)
cd $WORK
git clone https://github.com/sgymtic/sl.git
cd ./sl
make -j2
git checkout pyonpyon
make -j2
sudo ln -s $WORK/sl/pyonpyon /usr/local/bin/sl
