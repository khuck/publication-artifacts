#!/bin/bash -e
set -x

source ./sourceme.sh
module load nvhpc/22.5

variant=kokkos-cuda

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

export HWLOC_ROOT=${installdir}/hwloc

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_COMPILER=`which nvc++` \
-DCMAKE_INSTALL_PREFIX=${installdir}/${variant} \
-DKokkos_ARCH_SKX=ON \
-DKokkos_ENABLE_HWLOC=ON \
-DKokkos_ENABLE_TESTS=OFF \
-DKokkos_ENABLE_SERIAL=ON \
-DKokkos_ENABLE_CUDA=ON \
-DKokkos_ENABLE_CUDA_LAMBDA=ON \
-DKokkos_ARCH_AMPERE80=ON \
-DKokkos_HWLOC_DIR=${installdir}/hwloc \
${srcdir}/kokkos

make -j16
make install
