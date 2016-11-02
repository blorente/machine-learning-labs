examples = load('files/ex2data2.txt');
%visualize_examples(examples);

X = [ones(rows(examples), 1) examples(:, 1:2)];
X_extended = mapFeature(examples(:, 1), examples(:, 2));
y = examples(:, 3);
initial_thetas = zeros(1, columns(X_extended));
initial_lambda = 1;

options = optimset('GradObj', 'on', 'MaxIter', 400);
[thetas, total_cost] = fminunc(@(t) (cost_multiple(t, X_extended, y, initial_lambda)), initial_thetas, options);
correct_guesses = count_guesses(thetas, X_extended, y)
plotDecisionBoundary(thetas', X_extended, y);
