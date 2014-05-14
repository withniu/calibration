% Monocular calibration

addpath utils

% Load images
imgs = load_imgs('.', 'Hero*.png', [], []);

%%

vis          = true;
n_imgs       = numel(imgs);
pattern_size = [7 6];
image_points   = cell(n_imgs, 1);
found        = zeros(n_imgs, 1);
[h, w]       = size(imgs{1});
image_size   = [w, h];
% object_point = ce
%%

for idx = 1 : n_imgs
  img = imgs{idx};
  % Extract corners
  corners = cv.findChessboardCorners(imgs, pattern_size);
  
  % TODO: detect empty corners
  image_points{idx} = corners;
  object_points{idx} = 
  if vis
    img = cv.drawChessboardCorners(img, pattern_size, corners);
    figure(1); clf; imshow(img);
    pause;
  end
end