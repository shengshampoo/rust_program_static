
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

HOST_OS=$(uname -s)
HOST_ARCH=$(uname -m)

# xq
pkgss=xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git 
cd $pkgss 
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s" 
CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=clang 
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd $WORKSPACE/$pkgss/target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./$pkgss.tar.xz $pkgss
mv ./$pkgss.tar.xz /work/artifact/

