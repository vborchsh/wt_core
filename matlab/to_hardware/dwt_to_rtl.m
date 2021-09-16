
close all;
clear all;
clc;

%% ------------------------------------------------------------------------------
% Move one-step DWT to RTL code

%% PARAMETERS
pW_DAT = 64;

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
% dat = randi([-2^(pCOEF-1), 2^(pCOEF-1)-1], [1 pW_DAT]); % RND data
% dat = zeros(1, pW_DAT); dat(1, :) = 2^(pCOEF-1)-1; % MAX data
% dat = zeros(1, pW_DAT); dat(1, :) = -2^(pCOEF-1); % MIN data
dat = zeros(1, pW_DAT); dat(1, end/2) = 1; % delta-fucntion
% dat = zeros(1, pW_DAT); dat(1, 1) = 1; dat(1, end-1) = 1;

%% Write test data for simulation
pF = fopen('./dwt_core_input.dat', 'w');
fprintf(pF, '%d\n', dat);
fclose(pF);

%% ------------------------------------------------------------------------------
% Transformation
% Filtering
lres = filter(Lo_D, 1, dat); lres = floor(lres(1, 1:end));
hres = filter(Hi_D, 1, dat); hres = floor(hres(1, 1:end));
% Decimation
datL = lres(1, 1:2:end);
datH = hres(1, 1:2:end);

%% ------------------------------------------------------------------------------
% Read Questa simulation results
pF = fopen('./../../../sim/dwt_resp.dat', 'r');
res_fir = fscanf(pF, '%f %f\n', [2 Inf]);
fclose(pF);

%% ------------------------------------------------------------------------------
%% Plots
figure,
subplot(211), hold on, plot(datL, 'o-b'), plot(res_fir(2, :), 'x-r'), grid on, hold off; title('LPF');
subplot(212), hold on, plot(datH, 'o-b'), plot(res_fir(1, :), 'x-r'), grid on, hold off; title('HPF');


