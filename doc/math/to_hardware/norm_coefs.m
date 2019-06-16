close all ;
clear all ;
clc ;

%% ------------------------------------------------------------------------------
% Create .ini file with filters coefficients, adapted for hardware implementation

%% ------------------------------------------------------------------------------
% Parameters
wname = 'db6'; % Set wavelet name
c_f = 2^11;    % Set bit depth


%% ------------------------------------------------------------------------------
% Calculate coeffcients
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wname) ;

% Frequence spectre of coefficients
% fft_rh = 10*log10(abs(fft(Hi_R))) ;
% fft_rl = 10*log10(abs(fft(Lo_R))) ;
% hold on ;
% plot (fft_rh, 'g') ;
% plot (fft_rl, 'r') ;
% hold off ;

% Maschtabing
Lo_D = floor(c_f*Lo_D);
Hi_D = floor(c_f*Hi_D);
Lo_R = floor(c_f*Lo_R);
Hi_R = floor(c_f*Hi_R);

%% ------------------------------------------------------------------------------
% Write to file
f_id = fopen('coefs.ini', 'w');

fprintf(f_id, 'localparam int cL_D [%d] = ''{', length(Lo_D));
for i = 1:length(Lo_D(1,:))
    if (i == length(Lo_D(1,:)))
      fprintf(f_id, '%.d', Lo_D(1,i));
    else
      fprintf(f_id, '%.d,', Lo_D(1,i));
    end
end
fprintf(f_id, '};\r\n');

fprintf(f_id, 'localparam int cH_D [%d] = ''{', length(Hi_D));
for i = 1:length(Hi_D(1,:))
    if (i == length(Hi_D(1,:)))
      fprintf(f_id, '%.d', Hi_D(1,i));
    else
      fprintf(f_id, '%.d,', Hi_D(1,i));
    end
end
fprintf(f_id, '};\r\n');

fprintf(f_id, 'localparam int cL_R [%d] = ''{', length(Lo_R));
for i = 1:length(Lo_R(1,:))
    if (i == length(Lo_R(1,:)))
      fprintf(f_id, '%.d', Lo_R(1,i));
    else
      fprintf(f_id, '%.d,', Lo_R(1,i));
    end
end
fprintf(f_id, '};\r\n' ) ;

fprintf(f_id, 'localparam int cH_R [%d] = ''{', length(Hi_R));
for i = 1:length(Hi_R(1,:))
    if (i == length(Hi_R(1,:)))
      fprintf(f_id, '%.d', Hi_R(1,i));
    else
      fprintf(f_id, '%.d,', Hi_R(1,i));
    end
end
fprintf(f_id, '};\r\n' ) ;
