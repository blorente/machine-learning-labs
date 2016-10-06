function I = mcint(fun, a, b, num_puntos)
	puntos_estimacion = 10;
	coordsX = a:(b-a)/puntos_estimacion:b;
	coordsY = arrayfun (fun, coordsX);
	maxY = max(coordsY)
	
	puntosX = rand(num_puntos, 1).*(b - a).+a;
	puntosY = rand(num_puntos, 1).*maxY;
	resultadosY = arrayfun(fun, puntosX);
	debajo = sum(puntosY < resultadosY)
	I = (debajo / num_puntos)*(b - a)*maxY; 
endfunction
