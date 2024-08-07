#!/usr/bin/env bash

cat go-binary.txt | grep -v "^#" | xargs -I{} sh -c "echo install {} && go install {}@latest"
