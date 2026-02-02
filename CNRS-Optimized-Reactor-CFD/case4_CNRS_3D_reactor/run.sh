# suitable for openfoam.com versions 2306/2412
fluentMeshToFoam  -writeSets -writeZones  3D_Droptube_reactor_cavity_optimised_mesh.msh
splitMeshRegions -cellZones -overwrite
paraFoam -touchAll
decomposePar -allRegions -force
mpirun -np 8 chtMultiRegionFoam -parallel > chtMultiRegionFoam.log 
reconstructPar -allRegions -latestTime
postProcess -func sampleT -latestTime -region tube
postProcess -func sample_inletFlux -latestTime -region fluid_ar
postProcess -func sample_outletflux -latestTime -region fluid_ar
postProcess -func cuttingPlane -latestTime
