num_iters = 1500;
alpha = 0.01;

% Cargar ejemplos
examples = load('data/ex1data1.txt');
m = rows(examples);

% Generar vector de entrenamiento
% Se compone de parejas (1, x(i)),
% para poder calcular la hipótesis como 
% h(x) = [O0, O1, ..., On-1, On] * [1, x(1), ..., x(n-1), x(n)] =
% h(x) = vector de O traspuesto (en horizontal) * vector de x
X = [ones(m, 1) examples(:, 1)];
Y = examples(:, 2);

% Generar vector de thetas
thetas = zeros(2, 1)
thetas_buff = zeros(2, 1)

% Definir función de hipótesis
hypothesis = @(ths, vals) (ths*vals);

% Optimizar Thetas
for iter = 1:num_iters
	summations = sum_errors(hypothesis, X, Y, thetas);
	learn_adjusted = (alpha / m) .* summations';
	thetas_buff = thetas - learn_adjusted;
	thetas = thetas_buff;
endfor

plots(@(x) (thetas(1) + x*thetas(2)), [5:25], examples)
