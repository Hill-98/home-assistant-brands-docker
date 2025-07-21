#!/bin/bash
set -e

ROOT_DIR=$(dirname "$0")

cd "$ROOT_DIR"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y findutils git librsvg2-bin jq optipng rdfind rsync symlinks

git clone --depth=1 https://github.com/home-assistant/brands.git brands
cd brands
./scripts/build.sh > /dev/null

cd build
rdfind  -makesymlinks true -makeresultsfile false .
symlinks -c -r .
