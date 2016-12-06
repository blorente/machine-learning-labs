% Section 1.1 -> Linear kernel

% Load data from file
load('files/ex6data1.mat');

% Initial test parameters
C_small = 1;
C_large = 100;

% Models
%model_loose = svmTrain(X, y, C_small, @linearKernel, 1e-3, 20);
%model_tight= svmTrain(X, y, C_large, @linearKernel, 1e-3, 20);

% Visualization
%figure(1);
%visualizeBoundaryLinear(X, y, model_loose);
%figure(2);
%visualizeBoundaryLinear(X, y, model_tight);

%waitPress();
close all;

% Section 1.2 -> Gaussian Kernel

% Load data from file
load('files/ex6data2.mat');

% Initial parameters
C_gaussian = 1;
sigma = 0.1;

% Generate model
%model_gaussian = svmTrain(X, y, C_gaussian, @(x1, x2) gaussianKernel(x1, x2, sigma));

% Visualize result
%figure(1);
%visualizeBoundary(X, y, model_gaussian);

%waitPress();
close all;

% Section 1.3 -> C and sigma choice

% Load training data
load('files/ex6data3.mat');
m = rows(X);

% C and sigma value pool
seeds = [0.01; 0.03];
iterations = 3;
pool = generateValuePool(seeds, iterations);

% Generate models in order
% (We validate with the training set)
generateModelsFromPool(X, y, X, y, pool, '');

printf('Models generated!\n');

waitPress();
close all;
