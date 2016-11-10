function [all_theta] = oneVsAll(X, y, num_labels, lambda)
	%extended_y = repmat(y, rows(y), num_labels)

	labeled_y = y == 10
	arrayfun(@(label_index) (cat(2, labeled_y, (y == label_index))), 1:(num_labels - 1));

endfunction