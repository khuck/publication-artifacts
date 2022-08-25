#!/bin/bash -e
set -x

srcdir=`pwd`

rm -rf kokkos
mkdir kokkos
cd kokkos

export HPX_ROOT=$HOME/install/hpx/git
export HPX_DIR=$HOME/install/hpx/git

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_STANDARD=14 \
-DCMAKE_INSTALL_PREFIX=${HOME}/install/kokkos/git \
-DKokkos_ARCH_ICX=ON \
-DKokkos_ENABLE_HPX=ON \
-DKokkos_ENABLE_HPX_ASYNC_DISPATCH=ON \
-DKokkos_ENABLE_HWLOC=ON \
-DKokkos_ENABLE_TESTS=OFF \
-DKokkos_HWLOC_DIR=$HOME/install/hwloc \
$HOME/src/kokkos

make -j4
make install
