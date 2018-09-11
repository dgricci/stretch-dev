#!/bin/bash
## Dockerfile for compilation environment : C/C++ and make tools

# Exit on any non-zero status.
trap 'exit' ERR
set -E

clean=${1:-n}
clean=${clean:0:1}
clean=${clean,,[N]}

export DEBIAN_FRONTEND=noninteractive
echo "Installing g++, gcc and co ..."
apt-get -qy update
apt-get install -qy --no-install-recommends \
    gcc \
    g++ \
    libc6-dev \
    autoconf \
    automake \
    pkg-config \
    bison \
    flex \
    libtool \
    gettext \
    make \
    cmake
[ "${clean}" != "n" ] && rm -rf /var/lib/apt/lists/*

exit 0

