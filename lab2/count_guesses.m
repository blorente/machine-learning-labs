function correct = count_guesses(thetas, X, y)
  extended_thetas = repmat(thetas, rows(X), 1);
  guesses = dot(extended_thetas, X, 2);
  guesses_no = guesses(:, 1) < 0.5;
  guesses_yes = guesses(:, 1) >= 0.5;
  correct = rows(find(y(guesses_yes, 1) == 1)) + rows(find(y(guesses_no, 1) == 0))
endfunction
