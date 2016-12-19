function idx = findClosestCentroids(X,  centroids)
  m = rows(X);
  n = columns(X);
  k = rows(centroids);
  idx = zeros(m, 1);

  size(X)
  % Distances to each centroid
  distances = zeros(m, k);
  for i = 1:k
    centroids_ext = repmat(centroids(i, :), m, 1);
    distances(:, i) = abs(sqrt(sum((X .- centroids_ext)' .^ 2)));
  endfor
  [minel, idx] = min(distances, [], 2);
endfunction
