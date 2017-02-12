function [J, grad] = lrCostFunction(theta, X, y, lambda)
	hypotheses = sigmoid(X * theta);
	m = rows(X);
	J = 1/m * sum((-y.*log(hypotheses)) - ((1 - y).*log(1 - hypotheses)));
	J = J + lambda/2*m * sum(theta(2:columns(X),:) .^ 2);
	grad = 1/m * X' * (hypotheses - y);
	temp = theta;
	temp(1) = 0; % because we don't add anything for j = 0
	grad = grad + (lambda / m) .* temp;
endfunction
