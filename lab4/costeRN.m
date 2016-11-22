function [J, grad] = costeRN(params_rn, num_attribs, nodos_ocultos, num_etiquetas, X, y, lambda)
  % Capturar las matrices de pesos originales
  Theta1 = reshape (params_rn(1:nodos_ocultos * (num_attribs + 1)), nodos_ocultos, (num_attribs + 1));
  Theta2 = reshape (params_rn((1 + (nodos_ocultos * (num_attribs + 1))):end), num_etiquetas, (nodos_ocultos + 1));
  % Calcular las hipótesis mediante la propagación
  hypotheses = hypothesis(X, Theta1, Theta2);
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
  grad = Theta2(:, 2:end);
endfunction
