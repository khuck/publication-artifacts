
source sourceme.sh
module load rocmmod5.2.0

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=48
export KOKKOS_NUM_THREADS=${OMP_NUM_THREADS}

${installdir}/apex-hip/bin/apex_exec \
--apex:kokkos --apex:csv --apex:tasktree --apex:hip --apex:gtrace --apex:monitor_gpu --apex:period 5000 \
${builddir}/lulesh-hip/lulesh.hip -s 256
