%% selectBaseAttributes: Select a given set of attributes to be bases
function [X, y] = selectBaseAttributes(raw_data)
	% Y are the leagues of the players
	y = raw_data(:, 2);
	% The attributes are APM and WorkersCreated
	X = [raw_data(:, 6), raw_data(:, 17)];
end