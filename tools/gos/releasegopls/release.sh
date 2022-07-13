#!/usr/bin/env bash

cd /home/rammiah/github/tools/gopls

export GOROOT=~/.gos/go
export GOPATH=~/code/gopath
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$GOBIN:$PATH

set -x

export GOOS=linux GOARCH=amd64
go build -o tmp_build 
mv tmp_build /var/www/html/gopls-${GOOS}-${GOARCH}
export GOOS=linux GOARCH=386
go build -o tmp_build 
mv tmp_build /var/www/html/gopls-${GOOS}-${GOARCH}
export GOOS=windows GOARCH=amd64
go build -o tmp_build 
mv tmp_build /var/www/html/gopls-${GOOS}-${GOARCH}
export GOOS=windows GOARCH=386
go build -o tmp_build 
mv tmp_build /var/www/html/gopls-${GOOS}-${GOARCH}
export GOOS=darwin GOARCH=amd64
go build -o tmp_build 
mv tmp_build /var/www/html/gopls-${GOOS}-${GOARCH}

set +x
