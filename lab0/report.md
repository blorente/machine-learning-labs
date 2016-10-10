# Práctica 0
## Borja Lorente Escobar

Se ha desarrollado un programa que aproxima el área bajo una función en el intervalo [a, b] por el método de Monte Carlo.

## Llamada

```octave
// Aproxima el área bajo la función func en el intervalo [a, b], generando num_puntos
>> mcint(<func>, <a>, <b>, <num_puntos>)
```

## Código

La función aproxima primero el máximo de la función en el intervalo, para poder acotar el área en el que se generan puntos. A continuación, se generan un número especificado de puntos al azar, y se cuentan los que quedan por debajo de la función.

```octave
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
```

## Resultados
| Graphs | Results     |
| :------------- | :------------- |
|        | **mcint:**      |
|        | **quad:**      |
