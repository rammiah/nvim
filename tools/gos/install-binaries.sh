#!/usr/bin/env bash

cat go-binary.txt | xargs -I{} sh -c "echo install {} && go install {}@latest"
