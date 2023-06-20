## GradDescMicrobiota

GradDescMicrobiota is a repository that contains a modified version of µbialSim, which was originally published in "Popp, D. and F. Centler. 2020. “µbialSim: Constraint-Based Dynamic Simulation of Complex Microbiomes.”, Front. Bioeng. Biotechnol. 8 (June): 574. https://doi.org/10.3389/fbioe.2020.00574.". The original toolbox is licensed under the GNU General Public License v3.0. This modification includes a Gradient descent algorithm that allows the user to replicate relative abundance microbial community compositions.

## 

When using GradDescMicrobiota please cite the following: ""

## Changes Made

The modifications made to the original toolbox are:

  - Original scripts needed to run the examples found in https://git.ufz.de/UMBSysBio/microbialsim/-/blob/master/microbialSimMain.m have been removed, insted a script named "mainGradDesc.m" has been added to include the Gradient descent optimisation algorithm. This file is the main script to run the modelling scheme.
  
  - The following files have changes attached to them which are specified as comments in the script:
    - prepareFBAmodel.m
    - dFBASimulator.m
    - reactorDefinition.m
    - microbialSim.m
    
- Most of the code required to employ CellNetAnalyzer have been removed from the scripts. However, downloading the original files from the µbialSim toolbox, CNA can still be used.
    

## Requirements

- This modified toolbox requires:

   - COBRA Toolbox for FBA computations.
   
   -Information on the COBRA Toolbox is available here:
      
        https://opencobra.github.io/cobratoolbox/stable/index.html
        
## Usage

- To install and start using the modified toolbox, information is provided in the original publication's code (https://git.ufz.de/UMBSysBio/microbialsim).
- The main file to use the modelling scheme is: mainGradDesc.m
- The following files require user input in order to contextualize the framework to an specific model system:
     mainGradDesc.m
     microbialSimMain.m
     prepareFBAmodel.m
     reactorDefinition.m

- Files are included for the nutritional space used in the simulations (Unhealthy.txt & DMR38.xlsx). The unhealthy.txt is a .txt version of the diet with the same name which can be obtained from https://www.vmh.life/#nutrition. 

- Metabolic reconstructions for recreating the simulations of the original publication are included in the assets of this repository. In addition to this AGORA reconstructions are available in: https://www.vmh.life/#downloadview
   
## Authors and contact info
 - M.Sc. Juan Ricardo Velasco Álvarez, UPIBI, IPN. 
 -PhD. Jorge Isaac Chairez Oria, Tecnólogico de Monterrey, Campus Guadalajara
 
 Contact:
## License
  This modified toolbox is licensed under the GNU General Public License v3.0. A copy of the license is included in this repository.
