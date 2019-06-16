
function [res_Lo_D, res_Lo_R, res_Hi_D, res_Hi_R] = getWaveletStr(wt, prefix)

  [Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wt);
  
  %% Lo_D
  res_Lo_D = prefix;
  res_Lo_D = [res_Lo_D, 'Lo_D [', int2str(length(Lo_D)), '] = ''{'];
  for i = 1:length(Lo_D)
    if i > 1
      res_Lo_D = [res_Lo_D, ','];
    end

    res_Lo_D = [res_Lo_D, num2str(Lo_D(1, i), '%5.24f')];
  end
  res_Lo_D = [res_Lo_D, '};'];
  
  %% Hi_D
  res_Hi_D = prefix;
  res_Hi_D = [res_Hi_D, 'Hi_D [', int2str(length(Hi_D)), '] = ''{'];
  for i = 1:length(Hi_D)
    if i > 1
      res_Hi_D = [res_Hi_D, ','];
    end

    res_Hi_D = [res_Hi_D, num2str(Hi_D(1, i), '%5.24f')];
  end
  res_Hi_D = [res_Hi_D, '};'];
  
  %% Lo_R
  res_Lo_R = prefix;
  res_Lo_R = [res_Lo_R, 'Lo_R [', int2str(length(Lo_R)), '] = ''{'];
  for i = 1:length(Lo_R)
    if i > 1
      res_Lo_R = [res_Lo_R, ','];
    end

    res_Lo_R = [res_Lo_R, num2str(Lo_R(1, i), '%5.24f')];
  end
  res_Lo_R = [res_Lo_R, '};'];
  
  %% Hi_R
  res_Hi_R = prefix;
  res_Hi_R = [res_Hi_R, 'Hi_R [', int2str(length(Hi_R)), '] = ''{'];
  for i = 1:length(Hi_R)
    if i > 1
      res_Hi_R = [res_Hi_R, ','];
    end

    res_Hi_R = [res_Hi_R, num2str(Hi_R(1, i), '%5.24f')];
  end
  res_Hi_R = [res_Hi_R, '};'];

end
