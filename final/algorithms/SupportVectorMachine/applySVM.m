function [correct, ratio] = applySVM(X_train, y_train, X_val, y_val, seeds, iterations)
  pool = generateValuePool(seeds, iterations);
  [correct_mat, ratio_mat] = generateModelsFromPool(X_train, y_train, X_val, y_val, pool, 'linear');
end
