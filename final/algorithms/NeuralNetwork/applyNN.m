function [correct, ratio] = applyNN(X_train, y_train, X_test, y_test, input_layer_size, hidden_layer_size, num_labels, lambda, iterations)
  printf('\n');
  printf('-----------------------\n');
  printf('Applying Neural Network\n');
  printf('-----------------------\n');
  printf('Tags: %i, Lambda: %4i\n', num_labels, lambda);
  printf('Input Layer Size: %i, Hidden Layer Size: %4i\n', input_layer_size, hidden_layer_size);
  printf('Max. Iterations: %i\n', iterations);

  Thetas = createInitialThetas(input_layer_size, hidden_layer_size, num_labels);
  options = optimset('MaxIter', iterations);

  costFunction = @(p) costNN(p, input_layer_size, hidden_layer_size, num_labels, X_train, y_train, lambda);
  printf('Training NN...\n');
  [predictor, cost] = fmincg(costFunction, Thetas, options);
  [Theta1, Theta2] = recoverThetas(predictor, input_layer_size, hidden_layer_size, num_labels);
  printf('Done!\n\n');
  hypotheses = hypothesis(X_test, Theta1, Theta2);
  printf('\n');
  printf('Results:\n');
  [correct, ratio] = countCorrect(hypotheses, y_test);
end
