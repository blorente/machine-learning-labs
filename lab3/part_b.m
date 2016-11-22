load('files/ex3weights.mat');
load('files/ex3data1.mat');

results = zeros(rows(X), 10);
for i = 1:rows(results)
	results(i, :) = propagate(X(i, :), Theta1, Theta2);
endfor

[maxs, maxi] = max(results');

correct = sum(maxi' == y)
correct_ratio = correct / rows(X)