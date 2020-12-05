% ======================================================================
% DECENTRALIZED LOAD FREQUENCY CONTROL FOR A POWER SYSTEM WITH HIGH
% PENETRATION OF WIND AND SOLAR PHOTOVOLTAIC GENERATION
% ======================================================================

clc
clear
close all

% Simulation time
Ts = 50e-3;

% Loading 39-bus parameters for LFC model
system_parameters

% Control design
design_LFADRC

% Model simulation
sim('DecentralizedLFADRC.slx')

