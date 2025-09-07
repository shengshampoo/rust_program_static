
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

HOST_OS=$(uname -s)
HOST_ARCH=$(uname -m)

# xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git
cd xq
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
CARGO_TARGET_${HOST_ARCH}_UNKNOWN_LINUX_MUSL_LINKER="clang"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd $WORKSPACE/xq/target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./xq.tar.xz xq
mv ./xq.tar.xz /work/artifact/

# jless
cd $WORKSPACE
git clone https://github.com/PaulJuliusMartinez/jless.git
cd jless
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
CARGO_TARGET_${HOST_ARCH}_UNKNOWN_LINUX_MUSL_LINKER="clang"
cargo build --bin jless --target ${HOST_ARCH}-chimera-linux-musl --release
cd $WORKSPACE/jless/target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./jless.tar.xz jless
mv ./jless.tar.xz /work/artifact/
