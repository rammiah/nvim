#!/usr/bin/env bash

GOOS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case ${ARCH} in
    'x86_64')
        GOARCH='amd64'
        ;;
    'i386'|'x86')
        GOARCH='386'
        ;;
    *)
        echo "unspported arch ${ARCH}"
        exit -1
esac

LINK="https://awsl.xin/gopls-${GOOS}-${GOARCH}"
TARGET="$GOPATH/bin/gopls"
# TARGET="gopls"

wget -O ${TARGET} ${LINK}
