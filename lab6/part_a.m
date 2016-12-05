% Section 1.1 -> Linear kernel

% Load data from file
load('files/ex6data1.mat');

% Initial test parameters
C_small = 1;
C_large = 100;

% Models
model_loose = svmTrain(X, y, C_small,  @linearKernel , 1e-3, 20);
model_tight= svmTrain(X, y, C_large,  @linearKernel , 1e-3, 20);

% Visualization
figure(1);
visualizeBoundaryLinear(X, y, model_loose);
figure(2);
visualizeBoundaryLinear(X, y, model_tight);

waitPress();
close all;

% Section 1.2 -> Gaussian Kernel

% Load data from file
load('files/ex6data2.mat');

% Initial parameters
C_gaussian = 1;
sigma = 0.1;

% Generate model
model_gaussian = svmTrain(X, y, C_gaussian, @(x1, x2) gaussianKernel(x1, x2, sigma));

% Visualize result
figure(1);
visualizeBoundary(X, y, model_gaussian);

waitPress();
close all;

% Section 1.3 -> C and sigma choice

% Load training data
load('files/ex6data3.mat');

% C and sigma value pool
seeds = [0.01; 0.03];
iterations = 3;
pool = zeros(size(seeds), iterations);
for i = 0:iterations
  pool(:, i + 1) = seeds .* (10 ^ i);
endfor
pool = cartprod(pool);

% Section 1.3 -> C and sigma choice

% Load training data
load('files/ex6data3.mat');
m = rows(X);

% C and sigma value pool
seeds = [0.01; 0.03];
iterations = 3;
pool = zeros(size(seeds), iterations);
for i = 0:iterations
  pool(:, i + 1) = seeds .* (10 ^ i);
endfor
% Vectorize pool
poolsize = numel(pool);
pool = reshape(pool, 1, poolsize);

% Generate models in order
fig = 1;
for C = pool
  for sigma = pool
    % Tain machine and generate prediction
    model_gaussian = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    prediction = svmPredict(model_gaussian, X);

    % Calculate correctness and output result
    correct = sum(y == prediction);
    fraction = correct / m;
    printf('C: %f\nsigma: %f\ncorrect: %f\nperc. of total: %.2f\n', C, sigma, correct, (fraction * 100));

    % Uncomment to see the graphs
    %figure(fig); fig++;
    %visualizeBoundary(X, y, model_gaussian);
  endfor
endfor

printf('Models generated!\n');

waitPress();
close all;
