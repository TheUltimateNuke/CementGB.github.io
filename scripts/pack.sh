#!/usr/bin/env bash

# Saves the script's current path
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" || exit

# Remove previous build
rm -rf "$SCRIPTPATH/../build/"

# Pack pages into build
cp -rf "$SCRIPTPATH/../pages/landing/" "$SCRIPTPATH/../build"
cp -rf "$SCRIPTPATH/../pages/docs/_site" "$SCRIPTPATH/../build/docs"

# Compress build to tar.gz (unused)
# tar -czvf build.tar.gz ../build/ || exit 1