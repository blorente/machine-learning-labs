% Cargar ejemplos

examples = load('data/ex1data1.txt');
m = rows(examples)

% Generar vector de entrenamiento
% Se compone de parejas (1, x(i)),
% para poder calcular la hipótesis como 
% h(x) = [O0, O1, ..., On-1, On] * [1, x(1), ..., x(n-1), x(n)] =
% h(x) = vector de O traspuesto (en horizontal) * vector de x

X = [ones(m, 1) examples(:, 1)]

% Generar vector de thetas

O = zeros(2, 1)

% Cargar función de hipótesis


