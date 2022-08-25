
source sourceme.sh
module load rocmmod5.2.0

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=8

${installdir}/apex-openmp/bin/apex_exec \
--apex:ompt --apex:screen --apex:csv --apex:debug \
${builddir}/lulesh-pthread/lulesh.host
