
%-------------------------------------------------------------------------------
% Function create a Symmetric WAVELET tree
%-------------------------------------------------------------------------------

function [res] = idwt_top(dat, type, pnts)

  %% Check
  steps = log2(pnts);
  
  if (fix(steps)-steps ~= 0)
    error('IDWT CORE: Number of points must be ^2!')
  end
  
  %% Create and init
% % % %   figure(123);
% % % %   subplot(steps+1, 1, 1); plot(real(dat), 'x-b');
  
  %% Engine
  % First layer
  dat_idwt = [zeros(1, 12) dat(1, 1:end) zeros(1, 12)];
%   dat_idwt = dat(1, 1:end);
  dL = dat_idwt(1, 1:2:end);
  dH = dat_idwt(1, 2:2:end);
  res_idwt = idwt(dH, dL, type);
%   res_idwt = floor(res_idwt);
% % % %   subplot(steps+1, 1, 2); plot(10*log10(abs(fft(real(res_idwt))))), 'x-b');
  
  % Another layers
  for i = 2:steps
    dat_idwt = [zeros(1, 12) res_idwt(1, 1:end) zeros(1, 12)];
    dL = dat_idwt(1, 1:2:end);
    dH = dat_idwt(1, 2:2:end);
    res_idwt = idwt(dH, dL, type);
%     res_idwt = floor(res_idwt);
% % % %     [cL, cH] = dwt(res_idwt, type);
% % % %   figure(i);
% % % %   hold on;
% % % %   plot(dH);
% % % %   plot(cL, 'r');
% % % %   hold off;
% % % %     subplot(steps+1, 1, i+1); plot(real(res_idwt), 'x-b');
  end
  res = res_idwt;
end

