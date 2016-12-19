load('files/ex7data2.mat');

K = 3;
randidx = randperm(size(X,  1));
centroids = X(randidx(1:K) , :);

% Test
closestCentroids = findClosestCentroids(X, centroids);
newCentroids = computeCentroids(X, closestCentroids, K);

% Test
[centroids, idx] = runkMeans(X, [3 3; 6 2; 8 5], 10, true);
