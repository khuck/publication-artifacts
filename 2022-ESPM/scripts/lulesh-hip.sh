#!/bin/bash -e
set -x

source ./sourceme.sh
# To get clang, clang++
module load rocmmod5.2.0

variant=lulesh-hip

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ln -s ${srcdir}/kokkos-miniapps/lulesh-2.0/kokkos-no-uvm/* .
export KOKKOS_PATH=${srcdir}/kokkos
export KOKKOS_DEVICES="Hip,OpenMP"

make CXX=hipcc KOKKOS_PATH=${KOKKOS_PATH} KOKKOS_DEVICES=${KOKKOS_DEVICES} -f Makefile.hip lulesh.hip
