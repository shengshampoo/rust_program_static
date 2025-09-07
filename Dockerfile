FROM chimeralinux/chimera


RUN apk update
RUN apk upgrade

RUN apk add --no-cache \
    linux-headers musl-devel musl-devel-static \
    git curl cmake gmake aria2 \
    zlib-ng-compat-devel zlib-ng-compat-devel-static \
    openssl3-devel openssl3-devel-static \
    clang clang-devel clang-devel-static libunwind-devel libunwind-devel-static \
    libatomic-chimera-devel libatomic-chimera-devel-static \
    libarchive-progs libgcc-chimera cargo rust rust-src rust-std

RUN ln -s /usr/lib/libgcc_s.so.1 /usr/lib/libgcc_s.so
RUN ln -s /usr/sbin/cc /usr/sbin/musl-gcc

ENV RUSTFLAGS="-C target-feature=+crt-static -C linker=clang -C strip=symbols -C opt-level=s" 
ENV CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=clang
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_LINKER=clang

RUN aria2c -x2 -R https://raw.githubusercontent.com/shengshampoo/rust_program_static/refs/heads/main/build-static-lib.sh && \
chmod +x build-static-lib.sh && ./build-static-lib.sh
