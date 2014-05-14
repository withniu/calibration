function imgs = load_imgs(path, regex, idx, param)
% Load images in the given path with regex
% Inputs:
%   feature_window: cell array of 2D features
% Outputs:
%   cost: normalized cost within the temporal window
% Yedong Niu, 03/2014
  
  % Zoom factor
  if isfield(param, 'im_zoom')
    im_zoom = param.im_zoom;
  else
    im_zoom = 1.0;
  end
  % Rotation in degree
  if isfield(param, 'im_rot')
    im_rot = param.im_rot;
  else
    im_rot = 0.0;
  end
  % Flip along 1, 2, 0
  if isfield(param, 'im_flip')
    im_flip = param.im_flip;
  else
    im_flip = 0;
  end

  % List all files with regex in the path  
  files = dir(fullfile(path, regex));

  % Number of files
  n = numel(files);
  j = 1;

  if ~exist('idx', 'var') || isempty(idx)
    idx = 1 : n;
  end
  
  imgs = cell(numel(idx), 1);
  for i = idx
    filename = fullfile(path, files(i).name);
    
    dispnk(n, i, [filename ':']);
    % Resize
    img = imresize(imread(filename), im_zoom);
    % Flip if any
    if im_flip ~=0
      img = flipdim(img, im_flip);
    end
    % Rotate
    img = imrotate(img, im_rot);
    % Add to cell array
    imgs{j} = img;
    j = j + 1;   
  end

end
