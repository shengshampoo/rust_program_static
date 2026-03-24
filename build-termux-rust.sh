
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

# rustup installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile minimal --default-toolchain stable -y
source $HOME/.cargo/env && rustup target add aarch64-linux-android

# https://github.com/HomuHomu833/android-ndk-custom
curl -sL https://github.com/HomuHomu833/android-ndk-custom/releases/download/r29/android-ndk-r29-$(uname -m)-linux-musl.tar.xz | tar x --xz

mv /usr/bin/cc /usr/bin/cc.old
ln -sf /android-ndk-r29/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/clang /usr/bin/cc
export CC="/android-ndk-r29/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/aarch64-linux-android23-clang"
export PATH=/android-ndk-r29/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/:$PATH
export ANDROID_NDK_HOME="/android-ndk-r29"
export ANDROID_NDK="/android-ndk-r29"
export ANDROID_NDK_ROOT="/android-ndk-r29"

# dufs
cd $WORKSPACE
git clone https://github.com/sigoden/dufs
cd dufs
RUSTFLAGS="-C target-feature=+crt-static -C linker=/android-ndk-r29/toolchains/llvm/prebuilt/linux-$(uname -m)/bin/aarch64-linux-android23-clang -C strip=symbols -C opt-level=s" cargo build --target aarch64-linux-android --release
cd ./target/aarch64-linux-android/release/
tar vcJf ./dufs.tar.xz dufs
mv ./dufs.tar.xz /work/artifact/
