#!/usr/bin/env bash


[ $# -eq 0 ] && { echo "Usage: $0 version"; exit 1; }

VERSION=$1
if [[ $VERSION =~ ^go* ]]
then
	VERSION=${VERSION:2}
fi

TARGET="$HOME/.gos/go$VERSION"

if [ -d "$TARGET" ]
then
	rm -rf $TARGET &&\
		echo "remove go$VERSION success" ||\
		echo "remove go$VERSION fail"
else
	echo "go$VERSION not exist"
fi
