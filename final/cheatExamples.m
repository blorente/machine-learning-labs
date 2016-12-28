function [ X_out, y_out ] = cheatExamples(X, y, times)
  X_out = X;
  y_out = y;
  for i = 2:times
    X_out = [X_out; X];
    y_out = [y_out; y];
  end
end
