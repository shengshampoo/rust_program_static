
#! /bin/bash

set -e

WORKSPACE=/tmp/workspace
mkdir -p $WORKSPACE
mkdir -p /work/artifact

HOST_OS=$(uname -s)
HOST_ARCH=$(uname -m)

# bandwhich
pkgs="bandwhich"
cd $WORKSPACE
git clone https://github.com/imsnif/bandwhich.git
cd "${pkgs}"
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./${pkgs}.tar.xz -C /work/artifact/ ${pkgs}

# xq
pkgs="xq"
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./"${pkgs}".tar.xz -C /work/artifact/ "${pkgs}"

# jless
pkgs="jless"
cd $WORKSPACE
git clone https://github.com/PaulJuliusMartinez/jless.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --bin jless --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./${pkgs}.tar.xz -C /work/artifact/ ${pkgs}

# amp
pkgs="amp"
cd $WORKSPACE
git clone https://github.com/jmacdonald/amp.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./${pkgs}.tar.xz -C /work/artifact/ ${pkgs}

# starship
pkgs="starship"
cd $WORKSPACE
git clone https://github.com/starship/starship.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./${pkgs}.tar.xz -C /work/artifact/ ${pkgs}

# eza
pkgs="eza"
cd $WORKSPACE
git clone https://github.com/eza-community/eza.git
cd ${pkgs}
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
XZ_OPT=-e9 tar vcJf ./${pkgs}.tar.xz -C /work/artifact/ ${pkgs}
