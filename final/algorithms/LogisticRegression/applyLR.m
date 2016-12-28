%% applyLR: A function to apply oneVsAll logistic regression
function [correct, ratio] = applyLR(X, y, nr_tags)
	m = size(X, 1);
	lambda = 0.1;
	theta = zeros(columns(X) + 1, 1);

	X_ext = [ones(rows(X), 1) X];
	[all_theta] = oneVsAll(X_ext, y, nr_tags, lambda);
	[correct, ratio] = countCorrect(X_ext, y, all_theta)
end