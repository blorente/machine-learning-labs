examples = load('files/ex2data1.txt');
% visualize_examples(examples);

X = examples(:, 1:2);
y = examples(:, 3);
thetas = [0, 0];
cost(thetas, X, y)
