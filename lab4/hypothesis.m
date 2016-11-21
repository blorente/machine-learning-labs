function hypothesis_matrix = hypothesis(X, Theta1, Theta2)
  hypothesis_matrix = ones(rows(X), rows(Theta2));
  for i = 1:rows(X)
    hypothesis_matrix(i, :) = propagate(X(i, :), Theta1, Theta2);
  endfor
endfunction
