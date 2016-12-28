function [correct, ratio] = countCorrectNN(hypotheses, y_test)
  [maxs, maxi] = max(hypotheses');
  correct = sum(maxi' == y_test);
  ratio = correct / rows(y_test);
end  % countCorrectNN
