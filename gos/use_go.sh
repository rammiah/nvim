#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 version"; exit 1; }

VERSION=$1

TARGET="$HOME/.gos/go$VERSION"

if [ -d "$TARGET" ]
then
	rm -rf $HOME/.gos/go &&\
		ln -fs $TARGET $HOME/.gos/go  &&\
		echo "use go$VERSION success" ||\
		echo "use go$VERSION fail"
else
	echo "go$VERSION not exist"
fi

