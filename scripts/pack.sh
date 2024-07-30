#!/usr/bin/env bash

mkdir ../build/
mkdir ../build/docs/
mkdir ../build/api/
cp -r ./pages/landing ../build/
cp -r ./pages/docs/ ../build/docs/
cp -r ./pages/api/_site/ ../build/api/
tar -czvf build.tar.gz ../build/ || exit 1