#!/bin/bash -e
set -x

source ./sourceme.sh
module load nvhpc/22.5

variant=apex-cuda

if [ -d ${builddir}/${variant} ] ; then
    rm -rf ${builddir}/${variant}
fi
mkdir ${builddir}/${variant}
cd ${builddir}/${variant}

cmake \
-DCMAKE_C_COMPILER=`which nvc` \
-DCMAKE_CXX_COMPILER=`which nvc++` \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=${installdir}/${variant} \
-DAPEX_WITH_BFD=TRUE \
-DAPEX_WITH_OTF2=TRUE \
-DAPEX_WITH_CUDA=TRUE \
-DAPEX_WITH_MPI=FALSE \
-DAPEX_WITH_OMPT=TRUE \
-DAPEX_BUILD_OMPT=FALSE \
-DAPEX_WITH_PAPI=FALSE \
-DAPEX_WITH_LM_SENSORS=TRUE \
-DCUDAToolkit_ROOT=/packages/nvhpc/22.5_cuda11.7/Linux_x86_64/22.5/cuda/11.7 \
-DLM_SENSORS_ROOT=/home/users/khuck/src/lm-sensors/install \
-DBFD_ROOT=/usr/local/packages/binutils/2.34 \
${srcdir}/apex

make -j16
make install
