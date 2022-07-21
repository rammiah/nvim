#!/usr/bin/env bash

ls $HOME/.gos | grep -v ^go$
echo "current $(go version)"
