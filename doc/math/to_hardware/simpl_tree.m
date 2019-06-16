close all;
clear all;
clc;

display('// START--------------------------------------------------------------------------------');

addpath('../');

% --------------------------------------------------------------------------------------------------
%% Set filters coefficients


% c_f = 1;

[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('db6') ;

% pFILT_ORD = length(Lo_D);

% c_f = c_f*(sum(abs(Lo_D))) ;

% Lo_D = (c_f * Lo_D) ;
% Lo_D = floor(Lo_D) ;

% Hi_D = (c_f * Hi_D) ;
% Hi_D = floor(Hi_D) ;

% Lo_R = (c_f * Lo_R) ;
% Lo_R = floor(Lo_R) ;

% Hi_R = (c_f * Hi_R) ;
% Hi_R = floor(Hi_R) ;

% pWT_SIZE = 128;

% data = ones(1,pWT_SIZE) ;
% data = randi(128, 2, pWT_SIZE) ;

% data(1, end-9:end) = 0;
% data(1,     1:  9) = 0;

% --------------------------------------------------------------------------------------------------
%% IDWT

% res  = iwlet(data(1, 1:end), data(2, 1:end), Lo_R, Hi_R);
% res0 =  idwt(data(1, 1:end), data(2, 1:end), Lo_R, Hi_R);

% idwt_stream  = iwvlt_top(data(1:end, 1:end), c_f, Lo_R, Hi_R, pWT_SIZE);
% idwt_stream0 = iwvlt_top_magic(data, c_f, Lo_R, Hi_R, pWT_SIZE);

% figure(1);
% hold on;
% plot(res(1, 1:end), 'x-b');
% plot(res0(1, 1:end), 'r');
% hold off;

%% CHANNEL
% --------------------------------------------------------------------------------------------------




% --------------------------------------------------------------------------------------------------
%% DWT

% dwt_stream = wvlt_top(d, c_f, Lo_D, Hi_D, pWT_SIZE);

% [dwt_res(1,:), dwt_res(2,:)] = wlet(res(1, 1:end), Lo_D, Hi_D);

% [dwt_res0(1,:), dwt_res0(2,:)] = dwt(res0(1, 1:end), Lo_D, Hi_D);

% figure(3);
% hold on;
% plot(dwt_res_0(1, 1:end), 'x-b');
% plot(dwt_res0_0(1, 1:end), 'r');
% hold off;

% dwt_res0 = dwt_res0/2^32;
% 
% err     = abs(data - dwt_res) ;
% err_max = max(max(err))   ;
% err_min = min(min(err))   ;
% err_avg = mean(mean(err)) ;
% 
% figure(4);
% hold on;
% plot(data(1, 1:end), 'x-b');
% plot(dwt_res0(1, 1:end), 'r');
% hold off;

% --------------------------------------------------------------------------------------------------

dat = rand(1, 256);
% dat = ones(1, 64);
% dat = zeros(1, 64);
dat(1, end) = 0;
dat(1, 1:32) = 0;

res_idwt = idwt(zeros(1, 256), dat, Lo_R, Hi_R);
[res_dwt0, res_dwt1] = dwt(res_idwt, Lo_D, Hi_D);

spec_idwt = 10*log10(abs(fft(res_idwt)));
spec_dwt0 = 10*log10(abs(fft(res_dwt0)));
spec_dwt1 = 10*log10(abs(fft(res_dwt1)));

figure(1)
hold on;
plot(spec_idwt(1, 1:end));
plot(spec_dwt0, 'k');
plot(spec_dwt1, 'r');
hold off;

% figure(2)
% hold on;
% stairs(dat(1, 1:2:end), 'x-r');
% stairs(res_dwt0(1, 1:end), 'o-b');
% stairs(res_dwt1(1, 1:end), '*-g');
% hold off;









