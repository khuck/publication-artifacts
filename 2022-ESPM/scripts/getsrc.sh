#!/bin/bash -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
source ${SCRIPT_DIR}/sourceme.sh

set -x
cd ${srcdir}
if [ ! -d ${srcdir}/apex ] ; then
git clone git@github.com:UO-OACISS/apex.git
fi
if [ ! -d ${srcdir}/hpx ] ; then
git clone git@github.com:STEllAR-GROUP/hpx.git
fi
if [ ! -d ${srcdir}/hwloc-2.8.0 ] ; then
wget https://download.open-mpi.org/release/hwloc/v2.8/hwloc-2.8.0.tar.gz
tar -xzf hwloc-2.8.0.tar.gz
fi
if [ ! -d ${srcdir}/kokkos ] ; then
git clone git@github.com:kokkos/kokkos.git
fi
if [ ! -d ${srcdir}/kokkos-miniapps ] ; then
git clone git@github.com:kokkos/kokkos-miniapps.git
fi
