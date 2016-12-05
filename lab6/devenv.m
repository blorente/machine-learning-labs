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
