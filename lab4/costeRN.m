function [J, grad] = costeRN(params_rn, num_attribs, nodos_ocultos, num_etiquetas, X, y, lambda)
  % Capturar las matrices de pesos originales
  Theta1 = reshape (params_rn(1:nodos_ocultos * (num_attribs + 1)), nodos_ocultos, (num_attribs + 1));
  Theta2 = reshape (params_rn((1 + (nodos_ocultos * (num_attribs + 1))):end), num_etiquetas, (nodos_ocultos + 1));
  % Extender matriz y
  y = unrolly(y, num_etiquetas);

  % Calcular las hipótesis mediante la propagación
  [hypotheses, a1, z2, a2] = hypothesis(X, Theta1, Theta2);
  % Calcular el coste por cada etiqueta
  J = 0;
  for i = 1:num_etiquetas
    J = J + sum(-y(:, i).*log(hypotheses(:, i)) - ((1 - y(:, i)).*log(1 - hypotheses(:, i))));
  endfor
  % Ajustar al número de ejemplos
  m = rows(X);
  J = (1 / m) * J;
  % Aplicar parámetro de regularización
  Theta1_trim = Theta1(:, 2:columns(Theta1));
  Theta2_trim = Theta2(:, 2:columns(Theta2));
  J = J + ((lambda/(2*m))*(sum(sum(Theta1_trim .* Theta1_trim)) + sum(sum(Theta2_trim .* Theta2_trim))));

  % Back propagation para la gradiente
  % Calcular parametros iniciales
  deviation3 = hypotheses - y;
  deviation2 = Theta2'*deviation3' .* dsigmoid(z2');
  D2 = zeros(size(Theta2));
  D1 = zeros(size(Theta1));
  % Iterar sobre los ejemplos de entrenamiento
  for i = 1:m
		D2 = D2 + deviation3(i, :)' * a2(i, :);

		deviation2_change = deviation2(:, i);
		deviation2_change = deviation2_change(2:size(deviation2,1));
		D1 = D1 + deviation2_change * (a1(i,:));
  end
  % Calcular la gradiente con los valores acumulados
  Theta1_grad = (1 / m) * D1;
  Theta2_grad = (1 / m) * D2;
  % Construir vector a partir de las matrices de pesos
  grad = [Theta1_grad(:); Theta2_grad(:)];
endfunction
