
source sourceme.sh
module load rocmmod5.2.0

#export OMP_PROC_BIND=spread
#export OMP_PLACES=threads
export OMP_NUM_THREADS=48
export KOKKOS_NUM_THREADS=${OMP_NUM_THREADS}
export LD_LIBRARY_PATH=${installdir}/hpx/lib64:/usr/local/packages/boost/1.75.0/lib

export APEX_SCREEN_OUTPUT=1
${builddir}/lulesh-hpx/lulesh.host
