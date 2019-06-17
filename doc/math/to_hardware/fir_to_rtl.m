
close all;
clear all;
clc;

%% ------------------------------------------------------------------------------
% Move model of FIR filter to RTL code

%% PARAMETERS
pW_DAT = 32;

% ------------------------------------------------------------------------------
%% Create and load Doebechi wavelet
pCOEF = 16; % Working bit depth
pWLT  = 'db6';
[Lo_D, Hi_D] = wfilters(pWLT, 'd');
Lo_D = floor(Lo_D .* 2^(pCOEF-1));
Hi_D = floor(Hi_D .* 2^(pCOEF-1));
% ------------------------------------------------------------------------------
%% Create test data
rng(1);
dat = randi([-2^(pCOEF-1), 2^(pCOEF-1)-1], [1 pW_DAT]); % RND data
% dat = zeros(1, pW_DAT); dat(1, :) = 2^(pCOEF-1)-1; % MAX data
% dat = zeros(1, pW_DAT); dat(1, :) = -2^(pCOEF-1); % MIN data
% dat = zeros(1, pW_DAT); dat(1, end/2) = 1; % delta-fucntion
% dat = zeros(1, pW_DAT); dat(1, 1) = 1; dat(1, end-1) = 1;

%% Write test data for simulation
pF = fopen('./wt_fir_input.dat', 'w');
fprintf(pF, '%f\n', dat);
fclose(pF);

%% ------------------------------------------------------------------------------
% Transformation
% interpolation
datL = zeros(1, 2*length(dat)); datL(1, 1:2:end) = dat;
% filtering
res = filter(Lo_D, 1, datL); res = floor(res(1, 1:end));

%% ------------------------------------------------------------------------------
% Read Questa simulation results
pF  = fopen('./../../../sim/fir_resp.dat', 'r');
res_fir = fscanf(pF, '%f\n');
fclose(pF);

%% ------------------------------------------------------------------------------
%% Plots
figure, hold on;
plot(res, 'o-b');
plot(res_fir, 'x-r');
grid on;
hold off;


