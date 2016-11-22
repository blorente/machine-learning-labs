% Carga ejemplos de entrenamiento
load('files/ex4data1.mat');
% Carga pesos de referencia
load('files/ex4weights.mat');

% Parámetros iniciales
lambda = 1;
num_etiquetas = 10;

% Crear vector inicial de thetas:
Thetas = [Theta1(:); Theta2(:)];
%Thetas = [zeros(size(Theta1))(:); zeros(size(Theta2))(:)];
[J, grad] = costeRN(Thetas, columns(Theta1) - 1, rows(Theta1), num_etiquetas, X, y, lambda);
checkNNGradients(lambda)
