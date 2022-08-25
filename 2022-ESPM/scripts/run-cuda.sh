
source sourceme.sh
module load nvhpc/22.5

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=48
export KOKKOS_NUM_THREADS=${OMP_NUM_THREADS}

${installdir}/apex-cuda/bin/apex_exec \
--apex:kokkos --apex:csv --apex:tasktree --apex:cuda --apex:gtrace --apex:monitor_gpu --apex:period 5000 \
${builddir}/lulesh-cuda/lulesh.cuda -s 256
