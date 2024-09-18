#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" || exit

cp -rf "$SCRIPTPATH/../pages/landing/" "$SCRIPTPATH/../build"
cp -rf "$SCRIPTPATH/../pages/docs" "$SCRIPTPATH/../build/docs"
cp -rf "$SCRIPTPATH/../pages/api/_site" "$SCRIPTPATH/../build/api"
# tar -czvf build.tar.gz ../build/ || exit 1