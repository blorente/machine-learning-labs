function R = dsigmoid(X)
  R = sigmoid(X).*(1.-sigmoid(X))
endfunction
