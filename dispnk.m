function c = dispnk(n, k, msg1, msg2, c)
% Display k out of n
% Input
%   n - total number
%   k - current number
%   msg1, msg2 - [msg1 k / n msg2]

  if ~exist('msg1', 'var')
    msg1 = '';
  end

  if ~exist('msg1', 'var')
    msg1 = '';
  end
  
  if ~exist('msg2', 'var')
    msg2 = '...';
  end

  msg = [msg1 num2str(k) '/' num2str(n) msg2];
  if exist('c', 'var')
    b = repmat('\b', [1 c]);
    fprintf(b);
  end
  
  fprintf([msg '\n']);
  c = numel(msg);
end