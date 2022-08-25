#!/bin/bash -e
set -x

source ./sourceme.sh
module load rocmmod5.2.0

variant=apex-hip

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

ROCM_VERSION=5.2.0
ROCM_PATH=/opt/rocm-${ROCM_VERSION}

cmake \
-DCMAKE_C_COMPILER=${ROCM_PATH}/llvm/bin/clang \
-DCMAKE_CXX_COMPILER=${ROCM_PATH}/hip/bin/hipcc \
-DCMAKE_C_FLAGS=-gdwarf-4 \
-DCMAKE_CXX_FLAGS=-gdwarf-4 \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=${installdir}/${variant} \
-DAPEX_WITH_BFD=TRUE \
-DAPEX_WITH_OTF2=TRUE \
-DAPEX_WITH_HIP=TRUE \
-DAPEX_WITH_MPI=FALSE \
-DAPEX_WITH_OMPT=TRUE \
-DAPEX_BUILD_OMPT=FALSE \
-DAPEX_WITH_PAPI=TRUE \
-DAPEX_WITH_LM_SENSORS=TRUE \
-DLM_SENSORS_ROOT=/home/users/khuck/src/lm-sensors/install \
-DBFD_ROOT=/usr/local/packages/binutils/2.34 \
-DROCTRACER_ROOT=${ROCM_PATH}/roctracer \
-DROCPROFILER_ROOT=${ROCM_PATH}/rocprofiler \
-DROCTX_ROOT=${ROCM_PATH}/roctracer \
-DROCM_ROOT=${ROCM_PATH} \
-DPAPI_ROOT=/usr/local/packages/papi/2022-07-25-rocm-component \
${srcdir}/apex

make -j16
make install
