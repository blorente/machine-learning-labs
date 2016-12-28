%% applyLR: A function to apply oneVsAll logistic regression
function [correct, ratio] = applyLR(X, y, nr_tags, lambda, iterations)
	printf('\n');
	printf('---------------------------\n');
	printf('Applying Logistic Regresion\n');
  printf('---------------------------\n');
	printf('Tags: %i, Lambda: %4i\n', nr_tags, lambda);
	m = size(X, 1);
	theta = zeros(columns(X) + 1, 1);

	X_ext = [ones(rows(X), 1) X];
	[all_theta] = oneVsAll(X_ext, y, nr_tags, lambda, iterations);
	predictions = predict(all_theta, X_ext);
	[correct, ratio] = countCorrect(predictions, y);
	printf('Done!\n\n');
end
