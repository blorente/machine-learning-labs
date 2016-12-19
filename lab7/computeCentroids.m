function centroids = computeCentroids(X, idx , K)
  m = rows(X);
  n = columns(X);
  centroids = zeros(K, n);

  for k=1:K
  	centroids(k,:) = 1./(size(X(find(idx==k)),1)).*sum(X(find(idx==k),:));
  end

endfunction
