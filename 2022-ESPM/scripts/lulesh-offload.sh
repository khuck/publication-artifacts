#!/bin/bash -e
set -x

source ./sourceme.sh
# To get clang, clang++
module load rocmmod5.2.0

variant=lulesh-offload

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ln -s ${srcdir}/kokkos-miniapps/lulesh-2.0/kokkos-no-uvm/* .
export KOKKOS_PATH=${srcdir}/kokkos
export KOKKOS_DEVICES="OpenMPTarget"
export KOKKOS_CXX_STANDARD=c++17

make CXX=hipcc KOKKOS_PATH=${KOKKOS_PATH} KOKKOS_DEVICES=${KOKKOS_DEVICES} KOKKOS_CXX_STANDARD=${KOKKOS_CXX_STANDARD} -f Makefile lulesh.kk
