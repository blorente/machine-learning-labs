% Carga ejemplos de entrenamiento
load('files/ex4data1.mat');
% Carga pesos de referencia
load('files/ex4weights.mat');

% Parámetros iniciales
lambda = 1;
num_etiquetas = 10;

% Transformaciones de entrada para usar en funciones
y_unrolled = zeros(rows(y), num_etiquetas);
% Por cada valor de y, marcarlo en y_unrolled
for i = 1:num_etiquetas
  marks = y == i;
  y_unrolled(:, i) = marks;
endfor

% Crear vector inicial de thetas:
Thetas = [Theta1(:); Theta2(:)];
%Thetas = [zeros(size(Theta1))(:); zeros(size(Theta2))(:)];
[J, grad] = costeRN(Thetas, columns(Theta1) - 1, rows(Theta1), num_etiquetas, X, y_unrolled, lambda)
