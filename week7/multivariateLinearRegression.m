% code for linear regression

close all % close windows
clear all % clear variables

data=load("dataset_multivariate.txt");
[m,n] = size(data);
x = data(:,1:n-1);
y = data(:,n);

figure(1)
plot3(x(:,1), x(:,2), y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 8) 
hold on 

xlabel("x1: characteristic 1")
ylabel("x2: characteristic 2")
zlabel("x3: characteristic 3")
title("Data Plot")

% initial parameters

a = zeros(n,1); % column vector
beta = 0.1; % first you config beta at the end of first try
iterMax = 100; % second you config iters at the end of first try and after beta adjust

iter = 1;

% . for element by element operations: you dont need this for + nor -, only for / and *
% mean(matrix) will sompute the mean by column and will return a vector of n means for a matrix of n columns
mean_x = mean(x);
% std(matrix) will sompute the std by column and will return a vector of n std for a matrix of n columns
sigma = std(x);
% store normalized data in x_norm matrix
for i=1:m
  x_norm(i,:)= (x(i,:)-mean_x)./sigma;
end

figure(3)
plot3(x_norm(:,1), x_norm(:,2), y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 8) 
hold on 

xlabel("x1: characteristic 1")
ylabel("x2: characteristic 2")
zlabel("x3: characteristic 3")
title("Normalized Data Plot")

% add x_0 of ones
x = x_norm;
x = [ones(m,1) x];

h = zeros(m,1);
for i=1:m
  h(i) = a'*x(i,:)';
end

% sum() sums all vector elements
% . for element by element operation
J = (1/(2*m))*sum(((h - y).^2));
conv = [];

while(1)
  last_J = J;
  for j=1:n
    a(j) = a(j) - beta*(1/m)*sum((h - y).* x(:,j));
  end
  for i=1:m
    h(i) = a'*x(i,:)';
  end
  J = (1/(2*m))*sum(((h - y).^2));
  if ((last_J - J) <= eps)
    break;
  endif
  conv(iter) = J;  % conv[iter]
  iter = iter + 1;
end

% convergence plot
figure(2)
plot(conv, 'b')
xlabel("No. of Iterations")
ylabel("Convergence")
title("Convergence Plot")

% like a linspace 
x1 = -3:0.3:4; % start = -2 end = 4 by = 0.3
x2 = x1;
x1size = numel(x1);
X = [ones(x1size, 1), x1', x2'];

% for building place: all combinations of points
% now for each of this x,y linspace we calculate the hypothesis h to get the model plane
for i=1:x1size
  for j=1:x1size
    % H a mtrix
    H(i,j)=a'*X(i,:)';
  end
end

% x1 and x2 to matrix form
[x2,x1] = meshgrid(x1,x2);
% all three data in a matrix form
figure(3)
colormap(white)
% surf requires each of the three params in matrix form: which point goes with which point
surf(x1,x2,H,'FaceAlpha', 0.5)

display(["The J Error: ", num2str(J)])
display(["Total Iterations: ", num2str(iter)])

