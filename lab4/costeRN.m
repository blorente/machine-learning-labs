function [J, grad] = costeRN(params_rn, num_attribs, nodos_ocultos, num_etiquetas, X, y, lambda)
  Theta1 = reshape (params_rn(1:nodos_ocultos * (num_attribs + 1)), nodos_ocultos, (num_attribs + 1));
  Theta2 = reshape (params_rn((1 + (nodos_ocultos * (num_attribs + 1))):end), num_etiquetas, (nodos_ocultos + 1));
  hypothesis_matrix = hypothesis(X, Theta1, Theta2);
  J = 0;
  for i = 1:num_etiquetas
    partial_positive = y(:, i) .* log(hypothesis_matrix(:, i));
    partial_negative = (1 - y(:, i)) .* log(1 - hypothesis_matrix(:, i));
    J = J + sum(- partial_positive - partial_negative)
  endfor
  grad = Theta2;
endfunction
