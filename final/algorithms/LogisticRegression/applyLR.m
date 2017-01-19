%% applyLR: A function to apply oneVsAll logistic regression
function [correct, ratio] = applyLR(X_train, y_train, X_val, y_val, nr_tags, lambdas, iterations, graph)
	printf('\n');
	printf('---------------------------\n');
	printf('Applying Logistic Regresion\n');
  printf('---------------------------\n');
	m = size(X_train, 1);
	theta = zeros(columns(X_train) + 1, 1);
	for il = 1:columns(lambdas)
		lambda = lambdas(il);
		printf('Tags: %i, Lambda: %4i\n', nr_tags, lambda);
		X_train_ext = [ones(rows(X_train), 1) X_train];
		X_val_ext = [ones(rows(X_val), 1) X_val];
		[all_theta] = oneVsAll(X_train_ext, y_train, nr_tags, lambda, iterations);
		predictions = predict(all_theta, X_val_ext);
		[correct(il), ratio(il)] = countCorrect(predictions, y_val);
	end

	if graph == true
		plotResults(ratio, lambdas, 'LogisticRegression.png');
	end
	printf('Done!\n\n');
end
