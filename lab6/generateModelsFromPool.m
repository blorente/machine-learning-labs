function [] = generateModelsFromPool(X, y, X_val, y_val, pool, kind)
  m = rows(X_val);
  fig = 1;
  prediction_graph = zeros(size(pool), 3);
  for sigma = pool
      for C  = pool
      % Tain machine and generate prediction
      prediction = [];
      if (strcmp(kind, 'linear') == 1)
        model_linear = svmTrain(X, y, C, @linearKernel, 1e-1, 20);
        prediction = svmPredict(model_linear, X_val);
      else
        % Since kind is optional, train gaussian by default
        model_gaussian = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        prediction = svmPredict(model_gaussian, X_val);
      endif

      % Calculate correctness and output result
      correct = sum(y_val == prediction);
      fraction = correct / m;
      printf('C: %f\nsigma: %f\ncorrect: %f\nperc. of total: %.2f\n', C, sigma, correct, (fraction * 100));

      % Save information for the prediction graph data:
      prediction_graph(fig, :) = [C, sigma, fraction * 100];

      % Uncomment to see the graphs
      %figure(fig);
      %if (strcmp(kind, 'linear') == 1)
      %  visualizeBoundaryLinear(X, y, model_linear);
      %else
      %  visualizeBoundary(X, y, model_gaussian);
      %endif
      fig++;
    endfor
  endfor

  % Plot the accuracy
  plot3(prediction_graph(:, 1), prediction_graph(:, 2), prediction_graph(:, 3), 'o');
  title('Prediction accuracy');
  xlabel('C values');
  ylabel('Sigma values');
  zlabel('Acc. percent');
  print('prediction.png', '-dpng');
endfunction
