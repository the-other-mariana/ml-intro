clear all
close all

% returns h, is called g and receives z
function h = g(z)
  h = 1 / (1 + exp(-z));
end

data = load('dataset3.txt');

% 2 characteristics and y class column
[m, n] = size(data);

% separate x matrix and y col
% ranges are equal (0,100) BUT ranges are not -3, 3: we need normalization
x = (data(:,1:n-1));
y = (data(:,n));

mean_x = mean(x);
sigma = std(x);
% standarization or zscore function
x_norm = zscore(x);
x = x_norm;

% returns from y the indices that are y = 0 as pointers
indices_class0 = find(y==0);
indices_class1 = find(y==1);


% initial parameters
x = [ones(m,1) x];
% n = 3, x's + 1
a = [1; 1; 1];%ones(n,1);

% initial hypothesis for initial parameters
% take one x row each time
for i=1:m
  z = a' * x(i,:)';
  % column vector h
  h(i,1) = g(z);
  % by taking y(i) the J function is chosen
  J(i) = -y(i)*log(h(i))-(1 - y(i))*log(1 - h(i));
  display([num2str(i), ": ", num2str(J(i))])
  display([num2str(i), ": ", num2str(h(i))])
end

J = (1/m) * sum(J);



