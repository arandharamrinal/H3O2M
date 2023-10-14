#!/bin/bash
#ifort -r8 -O4 sGDML.f90 computeEnForce.f90 -o getfe.exe
gfortran -k8 -O4 -ffree-line-length-2048 sGDML.f90 computeEnForce.f90 -o getfe.exe
