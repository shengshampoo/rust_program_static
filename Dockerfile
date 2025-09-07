FROM chimeralinux/chimera


RUN apk update
RUN apk upgrade

# required by qemu
RUN apk add --no-cache \
    linux-headers musl-devel musl-devel-static \
    git curl cmake gmake \
    zlib-ng-compat-devel zlib-ng-compat-devel-static \
    openssl3-devel openssl3-devel-static \
    clang clang-devel clang-devel-static libunwind-devel libunwind-devel-static \
    libatomic-chimera-devel libatomic-chimera-devel-static \
    libarchive-progs libgcc-chimera cargo rust rust-src rust-std

RUN ln -s /usr/lib/libgcc_s.so.1 /usr/lib/libgcc_s.so
RUN ln -s /usr/sbin/cc /usr/sbin/musl-gcc

RUN aria2c -x2 -R build-static-lib.sh && \
chmod +x build-static-lib.sh && ./build-static-lib.sh
