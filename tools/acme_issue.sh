#!/usr/bin/env bash

if [ $# -eq 0 ];then
    echo "usage: $0 <domain>"
    exit -1
fi

set -o allexport
test -e .env && source .env
set +o allexport

$HOME/.acme.sh/acme.sh --issue --dns dns_ali -d $1
