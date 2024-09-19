#!/usr/bin/bash

# Saves the script's current path
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" || exit

# Install and fix PATH for docfx
dotnet tool update -g docfx
export PATH="$HOME/.dotnet/tools:$PATH"

# Build docs
docfx "$SCRIPTPATH/../pages/docs/docfx.json"

# Pack everything together nicely for deployment
bash "$SCRIPTPATH/pack.sh"