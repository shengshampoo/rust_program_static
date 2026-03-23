
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

# rustup installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --default-toolchain stable -y
source $HOME/.cargo/env && rustup target add aarch64-linux-android

# Android NDK
NDKK=android-ndk-r29-linux
curl -LO https://dl.google.com/android/repository/$NDKK.zip && unzip $NDKK.zip

mv /usr/bin/cc /usr/bin/cc.old
ln -sf /$NDKK/toolchains/llvm/prebuilt/$(uname -m)/bin/clang /usr/bin/cc

export CC="/$NDKK/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/aarch64-linux-android23-clang"
export PATH=/$NDKK/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/:$PATH
export ANDROID_NDK_HOME="/$NDKK"
export ANDROID_NDK="/$NDKK"
export ANDROID_NDK_ROOT="/$NDKK"

# dufs
cd $WORKSPACE
git clone https://github.com/sigoden/dufs
cd dufs
RUSTFLAGS="-C target-feature=+crt-static -C linker=/$NDKK/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/aarch64-linux-android23-clang -C strip=symbols -C opt-level=s" cargo build --target aarch64-linux-android --release
cd ./target/aarch64-linux-android/release/
tar vcJf ./dufs.tar.xz dufs
mv ./dufs.tar.xz /work/artifact/
