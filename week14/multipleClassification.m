clear all
pkg load io

global m

data = xlsread('dataset_multiclassOK.xlsx');
[m,n] = size(data);

% separate x from y
X = data(:,1:n-1);
Y = data(:, n);

% normalize data
mean_x = mean(X);
sigma = std(X);
X = zscore(X);

% get the number of classes
numClass = numel(unique(Y));
% codified output matrix (list of vectors)
D = zeros(m, numClass);
for i=1:m
  D(i, Y(i)) = 1;
end


W1 = 2*rand((n - 1)*2, n - 1) - 1;
W2 = 2*rand(numClass, (n - 1)*2) - 1;

max_epoch = 100;

[W1, W2, conv] = multiclass(W1, W2, X, D, max_epoch);

figure(1)
plot(conv)

% error count
for i=1:m
    % inner layer output v1
    v1 = W1 * X(i,:)';
    y1 = sigmoid(v1);
    % next layer output v
    v = W2 * y1;
    y(i,:) = softmax(v);
end

% transform to 1 the column that has > 0.8 probability
y = y > 0.8;
% decode columns to a single column with number of class
for i=1:m
  for j=1:numClass
    if y(i,j) == 1
      classes(i, 1) = j;
    end
  end
end

% total error as difference: count of wrongly classified data
error = sum(abs(Y - classes))
% count
em = y.*D;
good = sum(sum(em));
wrong = m - good
% test
test_data = [45 2 2 6500 22100];
x_test_norm = (test_data * mean_x)./sigma;

v_test = W1*x_test_norm';
y1_test = sigmoid(v_test);
out = W2*y1_test';
out = softmax(out)


