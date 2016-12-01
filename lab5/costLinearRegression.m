function [ J, grad ] = costLinearRegression( Theta, X, y, lambda )
  m = rows(X);

  % Calculate the hypotheses
  hyp = X * Theta;
  diff = hyp - y;
  % disp([X hyp y])

  % Initial cost
  J = sum(power(diff, 2)) / (2 * m);
  % For theta, remove the first row
  Theta_trim = [zeros(columns(Theta)) ; Theta(2:rows(Theta), :)];
  % Add regularization
  J = J + (lambda * sum(power(Theta_trim, 2)) / (2 * m));

  % Initialize gradient
  grad = zeros(size(Theta));
  % Unregularized values
  grad = (X' * diff) .* (1 / m);
  % Regularization term
  grad = grad .+ ((lambda / m) .* Theta_trim);

endfunction
