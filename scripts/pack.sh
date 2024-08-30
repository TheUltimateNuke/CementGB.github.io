#!/usr/bin/env bash

dotnet new tool-manifest
dotnet tool install docfx
sleep 1
dotnet tool run docfx ./pages/api/docfx.json

rm -r ./build
cp -rf ./pages/landing/ ./build
cp -rf ./pages/docs ./build/docs
cp -rf ./pages/api/_site ./build/api
# tar -czvf build.tar.gz ../build/ || exit 1