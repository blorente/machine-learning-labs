raw_data = dlmread('rawdata/starcraft.csv', ',');

source('./algorithms/LogisticRegression/manifest.m');
% Ignore the first row (names)
raw_data = raw_data(2:rows(raw_data), :);
% Select base attributes
[X, y] = selectBaseAttributes(raw_data);
[X, y] = cheatExamples(X, y, 10);
[correct, ratio] = applyLR(X, y, 8);
%[correct, ratio] = applyNN(X, y);
