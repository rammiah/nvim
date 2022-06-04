#!/usr/bin/env bash

cd /home/rammiah/github/tools

git checkout -- .
git apply tsprotocol.patch

./gopls/release.sh

git checkout -- .
