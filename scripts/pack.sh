#!/usr/bin/env bash

cp -rf ./pages/landing/ ./build
cp -rf ./pages/docs ./build/docs
cp -rf ./pages/api/_site ./build/api
# tar -czvf build.tar.gz ../build/ || exit 1