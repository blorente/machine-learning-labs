function [J, grad] = costeRN(params_rn, num_attribs, nodos_ocultos, num_etiquetas, X, y, lambda)
  % Capturar las matrices de pesos originales
  Theta1 = reshape (params_rn(1:nodos_ocultos * (num_attribs + 1)), nodos_ocultos, (num_attribs + 1));
  Theta2 = reshape (params_rn((1 + (nodos_ocultos * (num_attribs + 1))):end), num_etiquetas, (nodos_ocultos + 1));
 
  % Extender matriz y
  y_unrolled = unrolly(y, num_etiquetas);

  % Calcular las hipótesis mediante la propagación
  [hypotheses, a1, z2, a2] = hypothesis(X, Theta1, Theta2);
  % Calcular el coste por cada etiqueta
  J = 0;
  for i = 1:num_etiquetas
    J = J + sum(-y_unrolled(:, i).*log(hypotheses(:, i)) - ((1 - y_unrolled(:, i)).*log(1 - hypotheses(:, i))));
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
  
  % Front propagation
  a_1 = [ones(rows(X), 1), X];
  z_2 = Theta1 * a_1';
	a_2 = sigmoid(z_2);
	a_2 = [ones(1, columns(a_2)); a_2];
  z_3 = Theta2 * a_2;
	hypotheses = sigmoid(z_3);
  
  % Now hypotheses holds a hypothesis in each column,
  % with certainties for each label in a row
    
  deviation3 = hypotheses - y_unrolled';
  deviation2 = (Theta2' * deviation3) .* dsigmoid(z_2);
  Delta_2 = zeros(size(Theta2));
  Delta_1 = zeros(size(Theta1));
  
  % Iterar sobre los ejemplos de entrenamiento  
	Delta_2 = deviation3 * a_2';  
	deviation2_change = deviation2(2:size(deviation2,1), :);
 	Delta_1 = deviation2_change * (a_1);
  
  % Calcular la gradiente con los valores acumulados
  Theta1_grad = (1 / m) .* Delta_1;
  Theta2_grad = (1 / m) .* Delta_2;
  % Starts failing in the second col of THeta1_grad, the same with Theta_2_grad
  % Construir vector a partir de las matrices de pesos
  grad = [Theta1_grad(:); Theta2_grad(:)];
endfunction
