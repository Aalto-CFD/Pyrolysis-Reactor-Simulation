blockMesh
topoSet
splitMeshRegions -cellZones -overwrite
paraFoam -touchAll
changeDictionary -region pipe
changeDictionary -region topSolid
changeDictionary -region bottomSolid
decomposePar -allRegions -force
mpirun -np 4 chtMultiRegionFoam -parallel > chtMultiRegionFoam.log 
reconstructPar -allRegions -latestTime

