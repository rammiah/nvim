#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 VERSION"; exit 1; }

VERSION=$1
if [ ! -d "$HOME/.gos" ]
then
	echo "creating gos directory"
	mkdir "$HOME/.gos" || echo "create $HOME/.gos fail"
fi

if [ ! -d "$HOME/.gos" ]
then
	echo "create $HOME/.gos fail"
fi

cd $HOME/.gos &&\
	wget -O "go$VERSION.tar.gz" "https://golang.google.cn/dl/go$VERSION.linux-amd64.tar.gz" &&\
	tar -xvf "go$VERSION.tar.gz" -C /tmp/ &&\
	mv /tmp/go go$VERSION &&\
	rm -rf "go$VERSION.tar.gz" &&\
	echo "download go$VERSION success" ||\
	echo "download go$VERSION fail" &&\
	rm -rf "go$VERSION.tar.gz"

