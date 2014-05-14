% Monocular calibration
% Yedong Niu, 05/2014

% Load images
imgs = load_imgs('.', 'Hero*.png', [], []);

%%

vis          = false;
n_imgs       = numel(imgs);
pattern_size = [7 6];
image_points   = cell(n_imgs, 1);
found        = zeros(n_imgs, 1);
[h, w, c]    = size(imgs{1});
image_size   = [w, h];
object_point = cell(1, pattern_size(1) * pattern_size(2);
pattern_x    = 108;   % in mm
pattern_y    = 108;   % in mm

for y = 1 : pattern_size(2)
  for x = 1 : pattern_size(1)
    idx = (y - 1) * pattern_size(2) + x;
    object_point{idx} = [(x - 1) * pattern_x, (y - 1) * pattern_y, 0]; 
  end
end
%%

for idx = 1 : n_imgs
  img = imgs{idx};
  % Extract corners
  corners = cv.findChessboardCorners(img, pattern_size);
  
  % Mark found or not
  found(idx) = ~isempty(corners);
  image_points{idx} = corners;
  object_points{idx} = object_point;
  if vis
    img = cv.drawChessboardCorners(img, pattern_size, corners);
    figure(1); clf; imshow(img);
    pause;
  end
end

%[camera_matrix, dist_coeffs, d, rvecs, tvecs] = cv.calibrateCamera(object_points, image_points, image_size);
