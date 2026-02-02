blockMesh
topoSet
splitMeshRegions -cellZones -overwrite
paraFoam -touchAll
decomposePar -allRegions -force
mpirun -np 8 chtMultiRegionFoam -parallel > chtMultiRegionFoam.log 
reconstructPar -allRegions -latestTime

