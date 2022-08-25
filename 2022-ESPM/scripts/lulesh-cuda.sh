#!/bin/bash -e
set -x

source ./sourceme.sh
# To get clang, clang++
module load nvhpc/22.5

variant=lulesh-cuda

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ln -s ${srcdir}/kokkos-miniapps/lulesh-2.0/kokkos-no-uvm/* .
export KOKKOS_PATH=${srcdir}/kokkos
export KOKKOS_DEVICES="Cuda,OpenMP"
export KOKKOS_ARCH="Ampere80"
export NVCC_WRAPPER_DEFAULT_COMPILER=nvc++

make -j24 KOKKOS_PATH=${KOKKOS_PATH} KOKKOS_DEVICES=${KOKKOS_DEVICES} KOKKOS_ARCH=${KOKKOS_ARCH} -f Makefile.cuda lulesh.cuda
