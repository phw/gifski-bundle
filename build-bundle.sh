#!/usr/bin/env bash

set -e

cd $(dirname $0)
rm -rf build/
mkdir build
pushd build

git clone https://github.com/ImageOptim/gifski.git

pushd gifski
git checkout $GIFSKI_VERSION
mkdir -p .cargo
touch .cargo/config
cargo vendor --verbose --respect-source-config >> .cargo/config
popd

mkdir artifacts
rm -rf gifski/.git
tar cJf artifacts/gifski-bundle-$GIFSKI_VERSION.tar.xz gifski