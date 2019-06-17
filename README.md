# DWT/IDWT FPGA Core

Core of Discrete Wavelet Transformation (Reconstruction &amp; Decomposition), implemented for FPGA.

## Structure
<p>./doc - common folder for documentation

<p>./doc/math - mathematic models of RTL modules and operations

<p>./rtl - source SystemVerilog synthesizable codes

<p>./sim - simulation scripts (for QuestaSim)

<p>./tb - test enviroments source codes

## Current status
<p> Debugged IDWT/DWT MATLAB core for single-step transformation
<p> Debugged IDWT/DWT RTL core for single-step transformation

## TODO
<p> Creating a scalling-module for crop a resolution of output samples
<p> Creating a different-step wrapper for WT cores
<p> Making it a configuraible
<p> Creating a different-step wrapper for complex WT
<p> Creating a different-step wrapper for complex 2D-WT
