examples = load('files/ex2data1.txt');
% visualize_examples(examples);

X = examples(:, 1:2);
y = examples(:, 3);
initial_thetas = [0, 0];

options = optimset('GradObj', 'on', 'MaxIter', 400);
[thetas, total_cost] = fminunc(@(t) (cost(t, X, y)), initial_thetas, options)
correct_guesses = count_guesses(thetas, X, y);
