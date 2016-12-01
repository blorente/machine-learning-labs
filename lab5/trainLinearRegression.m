function [ Theta ] = trainLinearRegression( X, y, lambda )

  Theta_ini = zeros(size(X, 2), 1);
  % Shorthand
  costFunction = @(th) (costLinearRegression(th, X, y, lambda));
  % Define training options
  options = optimset('GradObj', 'on', 'MaxIter', 200);
  % Calculate the new values
  Theta = fmincg(costFunction, Theta_ini, options);

end  % function
