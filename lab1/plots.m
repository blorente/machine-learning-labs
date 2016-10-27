function plots(fun, X, points) 
	graphics_toolkit("gnuplot");
	plot(X, fun(X), points(:, 1)', points(:, 2)', '+');
endfunction