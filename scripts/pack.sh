#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" || exit

rm -rf "$SCRIPTPATH/../build/"
cp -rf "$SCRIPTPATH/../pages/landing/" "$SCRIPTPATH/../build"
cp -rf "$SCRIPTPATH/../pages/docs/_site" "$SCRIPTPATH/../build/docs"
# tar -czvf build.tar.gz ../build/ || exit 1