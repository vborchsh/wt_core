
%-------------------------------------------------------------------------------
% Function create a Symmetric WAVELET tree
%-------------------------------------------------------------------------------

function [res] = dwt_top(dat, type, pnts)

  %% Check
  steps = log2(pnts);
  
  if (fix(steps)-steps ~= 0)
    error('IDWT CORE: Number of points must be ^2!')
  end
  
  %% Create and init
% % % %   figure(124);
% % % %   subplot(steps+1, 1, 1); plot(abs(dat), 'o-r');
  
  %% Engine
  % First layer
  [cL, cH] = dwt(dat, type);
  res_dwt = zeros(1, 2*length(cL));
  res_dwt(1, 1:2:end) = cH;
  res_dwt(1, 2:2:end) = cL;
%   res_dwt = floor(res_dwt);
% % % %   subplot(steps+1, 1, 2); plot(abs(res_dwt), 'o-r');
  
  % Another layers
  for i = 2:steps
    [cL, cH] = dwt(res_dwt, type);
    res_dwt = zeros(1, 2*length(cL));
    res_dwt(1, 1:2:end) = cH;
    res_dwt(1, 2:2:end) = cL;
%     res_dwt = floor(res_dwt);
% % % %     subplot(steps+1, 1, i+1); plot(abs(res_dwt), 'o-r');
  end
  
  res = res_dwt;
end

