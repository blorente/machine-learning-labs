load('files/ex3data1.mat');

m = size(X, 1);
lambda = 0.000;
theta = zeros(columns(X) + 1, 1);

% Randomly select 100 examples
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

%displayData(sel);

X_ext = [ones(rows(X), 1) X];
%[J, grad] = lrCostFunction(theta, X_ext, y, lambda);
[all_theta] = oneVsAll(X_ext, y, 10, lambda);
correct = countCorrect(X_ext, y, all_theta)