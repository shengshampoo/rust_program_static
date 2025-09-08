
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
tar vcJf ./bandwhich.tar.xz bandwhich
mv ./bandwhich.tar.xz /work/artifact/

# xq
cd $WORKSPACE
git clone https://github.com/MiSawa/xq.git
cd xq
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./xq.tar.xz xq
mv ./xq.tar.xz /work/artifact/

# jless
cd $WORKSPACE
git clone https://github.com/PaulJuliusMartinez/jless.git
cd jless
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --bin jless --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./jless.tar.xz jless
mv ./jless.tar.xz /work/artifact/

# amp
cd $WORKSPACE
git clone https://github.com/jmacdonald/amp.git
cd amp
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lxcb -lXau -lXdmcp -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./amp.tar.xz amp
mv ./amp.tar.xz /work/artifact/

# starship
cd $WORKSPACE
git clone https://github.com/starship/starship.git
cd starship
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./starship.tar.xz starship
mv ./starship.tar.xz /work/artifact/

# eza
cd $WORKSPACE
git clone https://github.com/eza-community/eza.git
cd eza
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./eza.tar.xz eza
mv ./eza.tar.xz /work/artifact/

# coreutils
cd $WORKSPACE
git clone https://github.com/uutils/coreutils.git 
cd coreutils
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --bin coreutils --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./coreutils.tar.xz coreutils
mv ./coreutils.tar.xz /work/artifact/

# rg
cd $WORKSPACE
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release --features 'pcre2'
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./rg.tar.xz rg
mv ./rg.tar.xz /work/artifact/

# lsd
cd $WORKSPACE
git clone https://github.com/lsd-rs/lsd.git
cd lsd
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./lsd.tar.xz lsd
mv ./lsd.tar.xz /work/artifact/

# hexyl
cd $WORKSPACE
git clone https://github.com/sharkdp/hexyl.git
cd hexyl
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./hexyl.tar.xz hexyl
mv ./hexyl.tar.xz /work/artifact/

# rust-parallel
cd $WORKSPACE
git clone https://github.com/aaronriekenberg/rust-parallel.git
cd rust-parallel
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./rust-parallel.tar.xz rust-parallel
mv ./rust-parallel.tar.xz /work/artifact/

# fd 
cd $WORKSPACE
git clone https://github.com/sharkdp/fd
cd fd
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./fd.tar.xz fd
mv ./fd.tar.xz /work/artifact/

# heh
cd $WORKSPACE
git clone https://github.com/ndd7xv/heh
cd heh
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./heh.tar.xz heh
mv ./heh.tar.xz /work/artifact/

# pngquant
cd $WORKSPACE
git clone --recursive https://github.com/kornelski/pngquant.git
cd pngquant
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release --features=lcms2-static
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./pngquant.tar.xz pngquant
mv ./pngquant.tar.xz /work/artifact/

# gitoxide gix and ein
cd $WORKSPACE
git clone https://github.com/Byron/gitoxide.git
cd gitoxide
RUSTFLAGS="-C target-feature=+crt-static -C link-args=-L/usr/lib -lcrypto -lssl -lz -lm -lc -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./gix.tar.xz gix ein
mv ./gix.tar.xz /work/artifact/

# boringtun
cd $WORKSPACE
git clone https://github.com/cloudflare/boringtun
cd boringtun
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./boringtun.tar.xz boringtun
mv ./boringtun.tar.xz /work/artifact/

# rosenpass
cd $WORKSPACE
git clone https://github.com/rosenpass/rosenpass
cd rosenpass
RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s"
cargo build --target ${HOST_ARCH}-chimera-linux-musl --release
cd ./target/${HOST_ARCH}-chimera-linux-musl/release/
tar vcJf ./rosenpass.tar.xz rosenpass rp
mv ./rosenpass.tar.xz /work/artifact/
