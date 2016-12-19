A = double(imread('files/bird_small.png'));
A = A / 255;
rA = rows(A);
cA = columns(A);
A = reshape(A, rA * cA, 3);

K = 4; % The 16 most representative colors
iter = 10;
randidx = randperm(size(A,  1));
initCentroids = A(randidx(1:K) , :);

[centroids, idx] = runkMeans(A, initCentroids, iter, true);
idx = findClosestCentroids(A, centroids);
A = centroids(idx, :);
A = reshape(A, rA, cA, 3);

imagesc(A);

waitPress;
close all;
