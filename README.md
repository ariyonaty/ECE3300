# ECE3300
Work for ECE3300 - Digital Circuit Design at Cal Poly Pomona  
Instructor: Menglai Yin

## Prerequisites
  - Tested on linux
    - Ubuntu 18.04 (software buggy on 19.04)
  - Python3
  - Vivado Design Suite 2018.3
  - Xilinx FPGA
    - Using: Nexys A7 - 100T

## Running Vivado
  Note: may require escalated privileges.  
  Run:  
  `source /tools/Xilinx/Vivado/2018.3/settings64.sh && vivado`   
  
  OR   
  Create script:  
  `vim startVivado.sh`    
  Inside script:  
  `#!/bin/bash`  
  `source /tools/Xilinx/Vivado/2018.3/settings64.sh && vivado`  
  
### Note to reader
  Simply cloning the projects no longer works. 
  I have edited .gitignore to only include .v .xdc .bit .wcfg files
  - .v      :   verilog files
  - .xdc    :   board constraint file
  - .bit    :   bitstream file to simply upload to board
  - .wcfg   :   waveform configuration used for simulations

