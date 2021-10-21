#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 VERSION"; exit 1; }

if [ ! -d "$HOME/.gos" ]
then
	echo "creating gos directory"
	mkdir "$HOME/.gos" || echo "create $HOME/.gos fail"
fi

if [ ! -d "$HOME/.gos" ]
then
	echo "create $HOME/.gos fail"
fi

ARCH=""
case $(uname -m) in
	i386)   ARCH="386" ;;
	i686)   ARCH="386" ;;
	x86_64) ARCH="amd64" ;;
	arm)    dpkg --print-ARCH | grep -q "arm64" && ARCH="arm64" || ARCH="arm" ;;
esac

OS=""
case $(uname -s) in
	Darwin)	OS="darwin"	;;
	Linux)	OS="linux"	;;
esac

VERSION=$1

cd $HOME/.gos &&\
	wget -O "/tmp/go$VERSION.tar.gz" "https://golang.google.cn/dl/go$VERSION.$OS-$ARCH.tar.gz" &&\
	tar -xvf "/tmp/go$VERSION.tar.gz" -C /tmp/ &&\
	rm -rf go$VERSION &&\
	mv /tmp/go go$VERSION &&\
	rm -rf "go$VERSION.tar.gz" &&\
	echo "download go$VERSION success" ||\
	echo "download go$VERSION fail" &&\
	rm -rf "go$VERSION.tar.gz"

