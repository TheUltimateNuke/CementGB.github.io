#!/usr/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" || exit

dotnet tool update -g docfx
docfx "$SCRIPTPATH/../pages/docs/docfx.json"
bash "$SCRIPTPATH/pack.sh"