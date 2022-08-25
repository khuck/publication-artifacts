#!/bin/bash -e
set -x

source ./sourceme.sh
# To get clang, clang++
module load rocmmod5.2.0

variant=lulesh-pthread

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ln -s ${srcdir}/kokkos-miniapps/lulesh-2.0/kokkos-optimized/* .
export KOKKOS_PATH=${srcdir}/kokkos
export KOKKOS_DEVICES="Threads"

make KOKKOS_PATH=${KOKKOS_PATH} KOKKOS_DEVICES=${KOKKOS_DEVICES} lulesh.host
