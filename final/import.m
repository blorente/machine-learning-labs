warning('off');

% Import functions
source('./algorithms/LogisticRegression/manifest.m');
source('./algorithms/NeuralNetwork/manifest.m');
source('./algorithms/SupportVectorMachine/manifest.m');

raw_data = dlmread('rawdata/starcraft.csv', ',');
% Ignore the first row (names)
raw_data = raw_data(2:rows(raw_data), :);
% Select base attributes
[X, y] = selectBaseAttributes(raw_data);
%[X, y] = cheatExamples(X, y, 10);
[X_train, y_train, X_val, y_val, X_test, y_test] = splitSamples(X, y);
num_labels = 8;

% LR parameters
iterations_LR = 50;
lambda_LR = 0.01;
[correct_lr, ratio_lr] = applyLR(X, y, num_labels, lambda_LR, iterations_LR);

displayResults('LR', correct_lr, ratio_lr);
waitPress();

% NN parameters
input_layer_size = columns(X_train);
hidden_layer_size = 25;
lambda_nn = 0.01;
iterations_NN = 100;

[correct_nn, ratio_nn] = applyNN(X_train, y_train, X_test, y_test, input_layer_size, hidden_layer_size, num_labels, lambda_nn, iterations_NN);

displayResults('NN', correct_nn, ratio_nn);
waitPress();

% SVM parameters
CSigma_seeds = [0.01];
CSigma_iterations = 0;
print_graph = false;
[correct_svm, ratio_svm] = applySVM(X_train, y_train, X_val, y_val, CSigma_seeds, CSigma_iterations, print_graph);

displayResults('SVM', correct_svm, ratio_svm);
waitPress();
