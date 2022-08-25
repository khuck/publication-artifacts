#!/bin/bash -e
set -x
source ./sourceme.sh

cd ${builddir}
if [ -d hwloc ] ; then
    rm -rf hwloc
fi

mkdir ${builddir}/hwloc
cd ${builddir}/hwloc

${srcdir}/hwloc-2.8.0/configure --prefix=${installdir}/hwloc
make -j16
make install
