function[ X_poly ] = makePolynomial( X, p )

  X_poly = zeros(rows(X), p);

  for deg = 1:p
    poly = X .^ deg;
    X_poly(:, deg) = poly;
  endfor

endfunction
