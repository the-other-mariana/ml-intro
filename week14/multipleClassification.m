clear all
pkg load io

global m

data = xlsread('dataset_multiclassOK.xlsx');
[m,n] = size(data);

% separate x from y
X = (:1, n-1);
Y = (:, n);

% normalize data
X = zscore(X);

% get the number of classes
numClass = numel(unique(Y));
D = zeros(m, numClass);
for i=1:m
  D(i, Y(i)) = 1;
end


W1 = 2*rand((n - 1)*2, n - 1) - 1;
W1 = 2*rand(numClass, (n - 1)*2) - 1;

max_epoch = 100;

[W1, W2] = multiclass(W1, W2, X, D, max_epoch);
