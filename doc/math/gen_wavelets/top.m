
close all;
clear all;
clc;

display('// START--------------------------------------------------------------------------------');

pC_LOG = 16;
pC = 2^(pC_LOG-1);

% Open file
pF = fopen('./wavelets.ini', 'w');

% HAAR
[res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr('haar', ['localparam bit [', int2str(pC_LOG-1),  ':0] pHAAR_'], pC);
fwrite(pF, res_Lo_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Lo_R);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_R);
fprintf(pF, '\r\n');
fprintf(pF, '\r\n');
% DB
% %{
for i = 1:20
  wt = ['db', int2str(i)];
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam bit [', int2str(pC_LOG-1),  ':0] p', upper(wt), '_'], pC);
  fwrite(pF, res_Lo_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Lo_R);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_R);
  fprintf(pF, '\r\n');
  fprintf(pF, '\r\n');
end
% COIFLETS
for i = 1:5
  wt = ['coif', int2str(i)];
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam bit [', int2str(pC_LOG-1),  ':0] p', upper(wt), '_'], pC);
  fwrite(pF, res_Lo_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Lo_R);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_R);
  fprintf(pF, '\r\n');
  fprintf(pF, '\r\n');
end
% SYMLETS
for i = 2:20
  wt = ['sym', int2str(i)];
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam bit [', int2str(pC_LOG-1),  ':0] p', upper(wt), '_'], pC);
  fwrite(pF, res_Lo_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Lo_R);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_D);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_R);
  fprintf(pF, '\r\n');
  fprintf(pF, '\r\n');
end
% DISCRETE MEYER
[res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr('dmey', ['localparam bit [', int2str(pC_LOG-1),  ':0] pDMEY_'], pC);
fwrite(pF, res_Lo_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Lo_R);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_R);
fprintf(pF, '\r\n');
fprintf(pF, '\r\n');

%}







