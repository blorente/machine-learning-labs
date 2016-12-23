function [correct, correct_ratio] = countCorrect(X, y, thetas)
	num_labels = columns(thetas);
	predictions = zeros(rows(X), num_labels);
	for i = 1:num_labels
		predictions(:, i) = sigmoid(X * thetas(:, i));
	endfor

	[maxs, maxi] = max(predictions');

	correct = sum(maxi' == y);
	correct_ratio = correct / rows(X);
endfunction