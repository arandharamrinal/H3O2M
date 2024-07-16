# H<sub>3</sub>O<sub>2</sub><sup>-</sup>
Computes energy and force for gas-phase Hydroxide Hydrate ( H<sub>3</sub>O<sub>2</sub><sup>-</sup>)
==========================================================================
--------------------
Disclaimer: This program is a Fortran adaptation of the force and energy computation part of the 
Symmetric Gradient Domain Machine Learning (sGDML) model code {https://github.com/stefanch/sGDML}. 
This code has been tested successfully against the original implementation written in *python*. 

Usage in an MD code
-------------------
To utilize the PES in an MD code, follow these steps:
  1. Compile *sGDML.f90* routine.
  2.  Next, initialize the module by invoking the *loadSgdmlModel()* subroutine.
  3. Integrate the modules into the subroutine responsible for calculating Forces and Energies. To achieve this, include the line *use sgdmlvars* before specifying the variables.
  4. To compute the force and energy, use the *getForce(X, F, V)* subroutine. X represents the input Cartesian geometry in Angstrom (a 1x3N array), F denotes the force array with a dimension of 1x3N, and V (a scalar) stands for the potential. N is the total number of atoms (N=5 for  H<sub>3</sub>O<sub>2</sub><sup>-</sup>).

Cartesian coordinate format
---------------------------
The input geometries should be in the following format: the first two atoms must be oxygen atoms, followed by the three hydrogen atoms. 

PATH to parameter files
-----------------------
*sGDMLmodel* contains the fitted sGDML parameter file. By default, it must be in the same directory where the 
code is executed. 

Units
-----
All input geometries must be in Bohr. Output energies and forces are in Hartee and Hartee/Bohr, respectively.

Example
=======
Let's try computing energies and forces for already-known geometries to see how it works.
Goal: Read cartesian geometries from an input file and write the corresponding energies and forces to an outputfile 
Input and output file names should be specified in *input.param* file. 

*input.param* format
--------------------
First and second line of *input.param* contains the input file and output file names, respectively.

Compilation
-----------
Before running the code, compile it using the provided *compile.sh* script. The code is compatible with any Fortran compiler, and the default compiler used is *gfortran*. Ensure the *sGDMLmodel* folder containing the fitted parameter files is in the working directory.

Usage
-----
Run the compiled executable *getfe.exe*. The code will process the geometries, calculate energies and forces, and output the results to the output file. Each line in the output file will contain the energy followed by the forces for the corresponding geometry from the input file.

Input File Format
-----------------
The input file contains the Cartesian coordinates of each geometry written in a single line. 
A compressed file, *inputcoord.dat.gz*, with 100 test geometries, is available to use. The user 
must decompress this file using the *gunzip inputcoord.dat.gz* command. 

Output Format
-------------
The output energies will be in units of Hartee, and the forces will be in Hartee/Bohr. Each line in the output file will follow this format:
> Energy, F<sub>x</sub>, F<sub>y</sub>, F<sub>z</sub> of atom 1, F<sub>x</sub>, F<sub>y</sub>, F<sub>z</sub> of atom 2 ....

Abinitio Data
-------------
A dataset containing xyz coordinate, energies, forces, and dipole moments of hydroxide hydrate. All data are obtained at the CCSD(T)/AVTZ level of theory using CFOUR2.1 software.

h3o2m_traindata.tar, h3o2m_validation_data.tar, and h3o2m_testdata.tar contains the training, validation, and test data, respectively, as used in the paper [link](https://pubs.acs.org/doi/10.1021/acs.jpca.3c08027).

Units are :

Energy = Hartree (relative to the global minimum)

Geometry = Bohr

Forces = Hartree/Bohr

Feel free to reach out if you have any questions or need further assistance.
