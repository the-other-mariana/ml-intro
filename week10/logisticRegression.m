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

mean_x = mean(x);
sigma = std(x);
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
a = [0; 0; 1];%ones(n,1);
beta = 1.5;
iter_max = 50;
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

% samples for plotting the initial model (line) (theoretically, it is a plane)
% we can plot a line if z = 0
% x1 takes values within range -2 to 2 bc it is our range in the image
% thus we solve for x2 when z = 0 and x1 is [-2,2] and we get the line points
x1 = -2:0.1:2;
x2 = (-a(1)-a(2)*x1)/a(3);
plot(x1,x2,'r')

J = (1/m) * sum(J);

% iterative process
while(iter <= iter_max)
  for j=1:n
    a(j) = a(j) - beta*(1/m)*sum((h - y).*x(:,j));
  end
  % draw new line every time an adjustment to a happens
  figure(1)
  x2 = (-a(1)-a(2)*x1)/a(3);
  plot(x1,x2,'y')
  %pause(1)
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

figure(1)
x2 = (-a(1)-a(2)*x1)/a(3);
plot(x1,x2,'b')

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

% input normalization
data_input = [69, 78];
data_input = (data_input - mean_x)./sigma;
data_input = [1 data_input];
h_input = g(a' * data_input');
figure(1)
if h_input >= 0.5
  Y_input = 1;
  plot(data_input(2), data_input(3), 'dk', 'MarkerFaceColor', 'g', 'MarkerSize', 9)
else
  Y_input = 0;
  plot(data_input(2), data_input(3), 'ok', 'MarkerFaceColor', 'g', 'MarkerSize', 9)
end

% sum of the predicted Y and known y difference, as a percentage
error = (sum(abs(y-Y)) / m) * 100;

% J = 0.3268 is a lot if range is -3, 3: we can reduce error J
display(['J=', num2str(J), ' Error: ', num2str(error), '%'])