clear all
close all

% returns h, is called g and receives z
function h = g(z)
  h = 1 / (1 + exp(-z));
end

data = load('dataset2.txt');

% 2 characteristics and y class column
[m, n] = size(data);

% separate x matrix and y col
% ranges are equal (0,100) BUT ranges are not -3, 3: we need normalization
x = (data(:,1:n-1));
y = (data(:,n));

% standarization or zscore function
x_norm = zscore(x);
x = x_norm;

% returns from y the indices that are y = 0 as pointers
indices_class0 = find(y==0);
indices_class1 = find(y==1);

% plot class 0 points (x_1, x_2)
figure(1)
hold on
plot(x(indices_class0,1), x(indices_class0,2), 'ok', 'MarkerFaceColor', 'c', 'MarkerSize', 9)
plot(x(indices_class1,1), x(indices_class1,2), 'dk', 'MarkerFaceColor', 'm', 'MarkerSize', 9)
%axis([-2 2 -2 2])

% initial parameters
x = [ones(m,1) x];
% n = 3, x's + 1
a = zeros(n,1);
beta = 0.0001;
iter_max = 5;
iter = 1;

% initial hypothesis for initial parameters
% take one x row each time
for i=1:m
  z = a' * x(i,:)';
  % column vector h
  h(i,1) = g(z);
  % by taking y(i) the J function is chosen
  J(i) = -y(i)*log(h(i))-(1 - y(i))*log(1 - h(i));
end

J = (1/m) * sum(J);

% iterative process
while(iter <= iter_max)
  for j=1:n
    a(j) = a(j) - beta*(1/m)*sum((h - y).*x(:,j));
  end
  for i=1:m
    z = a' * x(i,:)';
    h(i,1) = g(z);
    J(i) = -y(i)*log(h(i))-(1 - y(i))*log(1 - h(i));
  end
  J = (1/m) * sum(J);
  conv(iter) = J;
  iter += 1;
end
figure(2)
plot(conv)
% prediction vector based on vector h
for i=1:m
  % rule
  if h(i) >= 0.5
    Y(i,1) = 1;
  else
    Y(i,1) = 0;
  end
end

indices_class0 = find(Y==0);
indices_class1 = find(Y==1);

% plot class 0 points (x_1, x_2) from predicted vector values
figure(3)
hold on
plot(x(indices_class0,2), x(indices_class0,3), 'ok', 'MarkerFaceColor', 'c', 'MarkerSize', 9)
plot(x(indices_class1,2), x(indices_class1,3), 'dk', 'MarkerFaceColor', 'm', 'MarkerSize', 9)


% J = 0.3268 is a lot if range is -3, 3: we can reduce error J
display(['J=', num2str(J)])