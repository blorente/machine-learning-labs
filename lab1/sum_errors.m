function summations = sum_errors(hypothesis_func, X, Y, thetas)
	summations = zeros(1, 2);
	for i = 1:rows(X)
		temp = (hypothesis_func(X(i, :), thetas) - Y(i));
		row = temp * X(i, :);
		summations += row;
	endfor
endfunction