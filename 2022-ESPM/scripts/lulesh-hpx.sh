#!/bin/bash -e
set -x

source ./sourceme.sh
module load gcc/10.2.0

variant=lulesh-hpx

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ln -s ${srcdir}/kokkos-miniapps/lulesh-2.0/kokkos-optimized/* .
export KOKKOS_PATH=${srcdir}/kokkos
export KOKKOS_DEVICES="HPX"
export KOKKOS_CXX_STANDARD=c++17
export PKG_CONFIG_PATH=/home/users/khuck/src/espm2022/install/hpx/lib64/pkgconfig

make CXX=g++ KOKKOS_PATH=${KOKKOS_PATH} KOKKOS_DEVICES=${KOKKOS_DEVICES} KOKKOS_CXX_STANDARD=${KOKKOS_CXX_STANDARD} -f Makefile lulesh.host -j16
