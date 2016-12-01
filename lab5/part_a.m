load('files/ex5data1.mat');

% Initial parameters
lambda = 0;
X_ext = [ones(rows(X), 1) X];
Xval_ext = [ones(rows(Xval), 1), Xval];

[J, grad] = costLinearRegression([1;1], X_ext, y, 1)
printf('Should be close to J = 303.99, grad = [-15.303, 598.250]\n');

waitPress();

Theta = trainLinearRegression(X_ext, y, lambda);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on;
plot(X, [ones(rows(X), 1) X]*Theta, '--', 'LineWidth', 2)
hold off;

waitPress();

[error_training error_validation] = getLearningCurves(X_ext, y, Xval_ext, yval, lambda);
plot(1:rows(X), error_training, 1:rows(X), error_validation);
title('Learning curve for linear regression')
xlabel('Number of training examples')
ylabel('Error')

waitPress();

powers = 8;
X_poly = makePolynomial(X, powers);
[X_poly, mu, sigma] = featureNormalize(X_poly);
X_poly_ext = [ones(rows(X), 1), X_poly];

X_poly_val = makePolynomial(Xval, powers);
X_poly_val = bsxfun(@minus, X_poly_val, mu);
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
X_poly_val_ext = [ones(size(X_poly_val, 1), 1), X_poly_val]; % Add Ones

% Train the predictor again with this extended feature set
lambda = 0;
Theta = trainLinearRegression(X_poly_ext, y, lambda);
plotFit(min(X), max(X), mu, sigma, Theta, powers);

[error_train, error_val] = getLearningCurves(X_poly_ext, y, X_poly_val_ext, yval, lambda);
plot(1:rows(X), error_train, 1:rows(X), error_val);

% Generate graphs for different types of lambda
for i = 1:4
  % Plot values 0.001, 0,01...
  figure = i;
  lambda = 0.001 * (10 ^ i);
  printCurve(X_poly_ext, y, X_poly_val_ext, yval, lambda, figure);

  % Plot values 0.003, 0.03...
  figure = 4 + i;
  lambda = 0.003 * (10 ^ i);
  printCurve(X_poly_ext, y, X_poly_val_ext, yval, lambda, figure);
endfor

waitPress();

close all;
