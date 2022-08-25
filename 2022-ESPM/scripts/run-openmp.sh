
source sourceme.sh
module load rocmmod5.2.0

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=24
export KOKKOS_NUM_THREADS=${OMP_NUM_THREADS}
export APEX_MEASURE_CONCURRENCY=1
#export APEX_MEASURE_CONCURRENCY_PERIOD=500000

${installdir}/apex-openmp/bin/apex_exec \
--apex:kokkos --apex:csv --apex:tasktree --apex:ompt --apex:ompt_details \
${builddir}/lulesh-openmp/lulesh.host -s 64 -p -i 200
