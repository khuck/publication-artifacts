#!/bin/bash -e
set -x

source ./sourceme.sh
module load gcc/10.2.0

variant=hpx

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

export HWLOC_ROOT=${installdir}/hwloc

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_COMPILER=`which g++` \
-DCMAKE_C_COMPILER=`which gcc` \
-DCMAKE_INSTALL_PREFIX=${installdir}/hpx  \
-DHPX_WITH_MALLOC=system \
-DHWLOC_ROOT=${HWLOC_ROOT} \
-DBOOST_ROOT=/usr/local/packages/boost/1.75.0 \
-DHPX_WITH_NETWORKING=OFF  \
-DHPX_WITH_PARCELPORT_MPI=OFF  \
-DHPX_WITH_EXAMPLES=OFF  \
-DHPX_WITH_TESTS=OFF  \
-DHPX_WITH_APEX=TRUE  \
-DHPX_WITH_APEX_TAG=develop \
-DHPX_WITH_FETCH_ASIO=ON \
${srcdir}/hpx

make -j24 -l24
make install
