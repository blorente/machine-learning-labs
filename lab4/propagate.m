function [hypothesis] = propagate(example, Theta1, Theta2)
	a_1 = [ones(rows(example), 1), example];
	a_2 = sigmoid(Theta1 * a_1');
	a_2 = [ones(1, columns(a_2)); a_2];
	hypothesis = sigmoid(Theta2 * a_2);
endfunction
