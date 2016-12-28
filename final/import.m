raw_data = dlmread('rawdata/starcraft.csv', ',');

source('./algorithms/LogisticRegression/manifest.m');
source('./algorithms/NeuralNetwork/manifest.m');
source('./algorithms/SupportVectorMachine/manifest.m');

% Ignore the first row (names)
raw_data = raw_data(2:rows(raw_data), :);
% Select base attributes
[X, y] = selectBaseAttributes(raw_data);
[X, y] = cheatExamples(X, y, 10);
[X_train, y_train, X_val, y_val, X_test, y_test] = splitSamples(X, y);

[correct_lr, ratio_lr] = applyLR(X, y, 8);

% NN parameters

[correct_nn, ratio_nn] = applyNN(X, y);

% SVM parameters
CSigma_seeds = [0.01, 0.03];
CSigma_iterations = 1;
[correct_svm, ratio_svm] = applySVM(X_train, y_train, X_val, y_val, CSigma_seeds, CSigma_iterations);
