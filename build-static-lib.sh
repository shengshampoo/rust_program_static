
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE

HOST_OS_RAW=$(uname -s)
HOST_ARCH_RAW=$(uname -m)

HOST_OS=${HOST_OS_RAW,,}
HOST_ARCH=${HOST_ARCH_RAW,,}

# xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git 
cd xq 
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s" 
CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=clang 
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
