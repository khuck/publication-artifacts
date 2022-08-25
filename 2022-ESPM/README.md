# ESPM 2022
Public artifacts ESPM 2022 submission.
To build the examples in the paper:
```
source scripts/sourceme.sh
./scripts/getsrc.sh
```
Build the APEX configurations:
```
./scripts/apex-cuda.sh
./scripts/apex-hip.sh
./scripts/apex-openmp.sh
```
Build HPX:
```
./scripts/hpx.sh
```
Build the 4 Lulesh versions with different back ends:
```
./scripts/lulesh-cuda.sh
./scripts/lulesh-hip.sh
./scripts/lulesh-hpx.sh
./scripts/lulesh-openmp.sh
```
Run the 4 Lulesh versions with different back ends:
```
./scripts/run-cuda.sh
./scripts/run-hip.sh
./scripts/run-hpx.sh
./scripts/run-openmp.sh
```

