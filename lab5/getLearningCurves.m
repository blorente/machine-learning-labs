function [ error_tr, error_val ] = getLearningCurves( X, y, Xval, Yval, lambda )
  % Initial values
  m = rows(X)
  error_tr = zeros(m, 1);
  error_val = zeros(m, 1);

  for i = 1:m
    % Generate subset of data to train with
    Xtrain = X(1:i, :);
    Ytrain = y(1:i);

    % Train the system to predict with that subset
    Theta_part = trainLinearRegression(Xtrain, Ytrain, lambda);

    % Calculate the error rate for the validation data and training
    error_tr(i) = costLinearRegression(Theta_part, Xtrain, Ytrain, 0)(1);
    error_val(i) = costLinearRegression(Theta_part, Xval, Yval, 0)(1);
  endfor
endfunction
