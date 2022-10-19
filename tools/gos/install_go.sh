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
    arm64)  ARCH="arm64" ;;
    arm)    dpkg --print-ARCH | grep -q "arm64" && ARCH="arm64" || ARCH="arm" ;;
esac

OS=""
case $(uname -s) in
    Darwin)	OS="darwin"	;;
    Linux)	OS="linux"	;;
esac

VERSION=$1
if [[ $VERSION =~ ^go* ]]
then
    VERSION=${VERSION:2}
fi

DOWN_FILE="/tmp/go$VERSION.tar.gz"

cd $HOME/.gos &&\
    wget -O "$DOWN_FILE" "https://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz" &&\
    tar -xvf "$DOWN_FILE" -C /tmp/ &&\
    rm -rf go$VERSION &&\
    mv /tmp/go go$VERSION &&\
    rm -rf "$DOWN_FILE" &&\
    echo "download go$VERSION success" ||\
    echo "download go$VERSION fail" &&\
    rm -rf "$DOWN_FILE"
