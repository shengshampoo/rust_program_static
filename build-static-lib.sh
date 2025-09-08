
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

HOST_OS=$(uname -s)
HOST_ARCH=$(uname -m)

# bandwhich
cd $WORKSPACE
git clone https://github.com/imsnif/bandwhich.git
cd bandwhich
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./bandwhich.tar.xz -C /work/artifact/ bandwhich

# xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git
cd xq
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./xq.tar.xz -C /work/artifact/ xq

# jless
cd $WORKSPACE
git clone https://github.com/PaulJuliusMartinez/jless.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --bin jless --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./jless.tar.xz -C /work/artifact/ jless

# amp
cd $WORKSPACE
git clone https://github.com/jmacdonald/amp.git
cd amp
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./amp.tar.xz -C /work/artifact/ amp

# starship
cd $WORKSPACE
git clone https://github.com/starship/starship.git
cd starship
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./starship.tar.xz -C /work/artifact/ starship

# eza
cd $WORKSPACE
git clone https://github.com/eza-community/eza.git
cd eza
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./eza.tar.xz -C /work/artifact/ eza
