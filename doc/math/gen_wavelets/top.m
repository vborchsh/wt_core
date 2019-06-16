
close all;
clear all;
clc;

display('// START--------------------------------------------------------------------------------');

pC = 2^8;

% Open file
pF = fopen('./wavelets.ini', 'w');

% HAAR
[res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr('haar', 'localparam real pHAAR_');
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
for i = 1:20
  wt = ['db', int2str(i)];
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam real p', upper(wt), '_']);
  fwrite(pF, res_Lo_D .* pC);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Lo_R .* pC);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_D .* pC);
  fprintf(pF, '\r\n');
  fwrite(pF, res_Hi_R .* pC);
  fprintf(pF, '\r\n');
  fprintf(pF, '\r\n');
end
% COIFLETS
for i = 1:5
  wt = ['coif', int2str(i)];
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam real p', upper(wt), '_']);
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
  [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, ['localparam real p', upper(wt), '_']);
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
[res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr('dmey', 'localparam real pDMEY_');
fwrite(pF, res_Lo_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Lo_R);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_D);
fprintf(pF, '\r\n');
fwrite(pF, res_Hi_R);
fprintf(pF, '\r\n');
fprintf(pF, '\r\n');









