raw_data = dlmread('rawdata/starcraft.csv', ',');
% Ignore the first row (names)
raw_data = raw_data(2:rows(raw_data), :);
% Select base attributes
[X, y] = selectBaseAttributes(raw_data);
[correct, ratio] = applyLR(X, y, 8); 
