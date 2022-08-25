#!/bin/bash -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "SCRIPT_DIR: ${SCRIPT_DIR}"

module purge
basedir=$(dirname ${SCRIPT_DIR})
export builddir=${basedir}/build
export srcdir=${basedir}/src
export installdir=${basedir}/install
echo "Working directory: ${basedir}"
if [ ! -d ${srcdir} ] ; then
    mkdir -p ${srcdir}
fi
if [ ! -d ${builddir} ] ; then
    mkdir -p ${builddir}
fi
if [ ! -d ${installdir} ] ; then
    mkdir -p ${installdir}
fi
