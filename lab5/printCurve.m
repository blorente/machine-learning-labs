function [] = printCurve( X, y, Xval, yval, lambda, fig )
  figure(fig);
  [error_train, error_val] = getLearningCurves(X, y, Xval, yval, lambda);
  plot(1:rows(X), error_train, 1:rows(X), error_val);
  title(['Learning curve for linear regression. ', 'Lambda = ', num2str(lambda)])
  xlabel('Number of training examples')
  ylabel('Error')
endfunction
