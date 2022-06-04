#!/usr/bin/env bash

set -x
cd /home/rammiah/github/tools

git checkout -- .

gh repo sync

git apply tsprotocol.patch

./gopls/release.sh

git checkout -- .

set +x
