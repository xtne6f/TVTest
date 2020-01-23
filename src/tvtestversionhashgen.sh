#!/bin/bash

git_hash=$(git rev-parse --short HEAD)

if [ $? -eq 0 ]
then
    grep -q "$git_hash" TVTestVersionHash.h || echo -e -n "#define VERSION_HASH_A \"${git_hash}\"\r\n" >TVTestVersionHash.h
else
    rm -f TVTestVersionHash.h
fi
