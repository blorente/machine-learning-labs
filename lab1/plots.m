function plots(fun, X, points) 
	graphics_toolkit("gnuplot");
	plot(X, fun(X), points(:, 1)', points(:, 2)', '+');
	print("lab1_part1.png", "-dpng");
endfunction