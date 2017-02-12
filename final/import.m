clear all;
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
iterations_LR = 500;
lambdas_LR = [0.0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.065, 0.075, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5];
graph_LR = true;

[correct_lr, ratio_lr] = applyLR(X_train, y_train, X_val, y_val, num_labels, lambdas_LR, iterations_LR, graph_LR);

displayResults('LR', correct_lr, ratio_lr);
waitPress();
%
% % NN parameters
input_layer_size = columns(X_train);
hidden_layer_sizes = [5, 10, 25, 50, 100];
lambdas_nn = [0.0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.065, 0.075, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5];
iterations_NN = 5000;
graph_nn = true;

[correct_nn, ratio_nn] = applyNN(X_train, y_train, X_test, y_test, input_layer_size, hidden_layer_sizes, num_labels, lambdas_nn, iterations_NN, graph_nn);

displayResults('NN', correct_nn, ratio_nn);
waitPress();

% SVM parameters
CSigma_seeds = [0.01, 0.02, 0.03, 0.04];
CSigma_iterations = 3;
print_graph = true;
[correct_svm, ratio_svm] = applySVM(X_train, y_train, X_val, y_val, CSigma_seeds, CSigma_iterations, print_graph);

displayResults('SVM', correct_svm, ratio_svm);
waitPress();
