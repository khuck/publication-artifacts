#!/bin/bash -e
set -x

source ./sourceme.sh
# To get clang, clang++
module load rocmmod5.2.0

variant=kokkos-openmp

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

export HWLOC_ROOT=${installdir}/hwloc

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_COMPILER=`which clang++` \
-DCMAKE_C_COMPILER=`which clang` \
-DCMAKE_INSTALL_PREFIX=${installdir}/${variant} \
-DKokkos_ARCH_ICX=ON \
-DKokkos_ENABLE_HWLOC=ON \
-DKokkos_ENABLE_TESTS=OFF \
-DKokkos_ENABLE_SERIAL=OFF \
-DKokkos_ENABLE_OPENMP=ON \
-DKokkos_HWLOC_DIR=${installdir}/hwloc \
${srcdir}/kokkos

make -j16
make install
