
close all;
clear all;
clc;

%% ------------------------------------------------------------------------------
% Move one-step complex IDWT to RTL code

%% ------------------------------------------------------------------------------
% Create and load Doebechi wavelet
pCOEF = 11; % Working bit depth
pWLT  = 'db6';
[Lo_D, Hi_D] = wfilters(pWLT, 'd');
Lo_D = floor(Lo_D .* 2^pCOEF);
Hi_D = floor(Hi_D .* 2^pCOEF);

%% ------------------------------------------------------------------------------
% Create test data
rng(1);
dat = randi(2047, [1 32]) + 1i*randi(2047, [1 32]);
dl = dat(1, 1:2:end);
dh = dat(1, 2:2:end);
% Write test data for simulation
pF  = fopen('../../../testbench/idwt_src.dat', 'w');
fscanf(pF, '%f %f\n', [2 inf]);
fclose(pF);

%% ------------------------------------------------------------------------------
% Transformation
% MATLAB
ref = idwt(dl, dh, Lo_D, Hi_D);
ref = floor(ref);
% Handmade
  % interpolation
  datL = zeros(1, 2*length(dl)); datL(1, 1:2:end) = dl;
  datH = zeros(1, 2*length(dh)); datH(1, 1:2:end) = dh;
  % filtering
  lres = filter(Lo_D, 1, datL); lres = floor(lres(1, 1:end));
  hres = filter(Hi_D, 1, datH); hres = floor(hres(1, 1:end));
  res  = (lres(1, 1:end) + hres(1, 1:end));
  % Inversion of IMAGINE part ??? WHY ???
  res  = real(res(1, 1:end)) - 1i*imag(res(1, 1:end));

%% ------------------------------------------------------------------------------
% Read Questa simulation results
pF  = fopen('../../../testbench/tb_fir/idwt_sim_res.dat', 'r');
res_fir = fscanf(pF, '%f %f\n', [2 inf]);
fclose(pF);
rdat = res_fir(1, 1:end);
idat = res_fir(2, 1:end);

pF  = fopen('../../../testbench/tb_idwt_core/idwt_sim_res.dat', 'r');
res_idwt = fscanf(pF, '%f %f\n', [2 inf]);
fclose(pF);


%% ------------------------------------------------------------------------------
% % Real part of FIR response
% figure(1);
% hold on;
% plot(real(lres), 'o-b');
% plot(rdat, 'x-r');
% hold off;
% % Imag part of FIR response
% figure(2);
% hold on;
% plot(imag(lres), 'o-b');
% plot(idat, 'x-r');
% hold off;
% Real part of IDWT response
figure(3);
hold on;
% plot(res_idwt(1, 1:end), 'o-b');
plot(real(ref), 'x-r');
hold off;
% Imag part of IDWT response
figure(4);
hold on;
% plot(res_idwt(2, 1:end), 'o-b');
plot(imag(ref), 'x-r');
hold off;


