#!/usr/bin/env bash

cd $(dirname $0)
rm -rf gifski/
mkdir build
pushd build

git clone https://github.com/ImageOptim/gifski.git

pushd gifski
mkdir -p .cargo
touch .cargo/config
cargo vendor --respect-source-config >> .cargo/config
popd

mkdir artifacts
rm -rf gifski/.git
tar cJvf artifacts/gifski-bundle.tar.xz gifski