
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
XZ_OPT=-e9 tar vcJf ./bandwhich.tar.xz bandwhich
mv ./bandwhich.tar.xz /work/artifact/

# xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git
cd xq
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./xq.tar.xz xq
mv ./xq.tar.xz /work/artifact/

# jless
cd $WORKSPACE
git clone https://github.com/PaulJuliusMartinez/jless.git
cd jless
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --bin jless --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./jless.tar.xz jless
mv ./jless.tar.xz /work/artifact/

# amp
cd $WORKSPACE
git clone https://github.com/jmacdonald/amp.git
cd amp
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./amp.tar.xz amp
mv ./amp.tar.xz /work/artifact/

# starship
cd $WORKSPACE
git clone https://github.com/starship/starship.git
cd starship
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./starship.tar.xz starship
mv ./starship.tar.xz /work/artifact/

# eza
cd $WORKSPACE
git clone https://github.com/eza-community/eza.git
cd eza
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./eza.tar.xz eza
mv ./eza.tar.xz /work/artifact/
