% code for multivariate linear regression w/o normalization

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
beta = 0.00000001; % first you config beta at the end of first try
iterMax = 150; % second you config iters at the end of first try and after beta adjust

iter = 1;

% add x_0 of ones
x = [ones(m,1) x];

h = zeros(m,1);
for i=1:m
  h(i) = a'*x(i,:)';
end

% sum() sums all vector elements
% . for element by element operation
J = (1/(2*m))*sum(((h - y).^2));
conv = [];

while(iter <= iterMax)
  for j=1:n
    a(j) = a(j) - beta*(1/m)*sum((h - y).* x(:,j));
  end
  for i=1:m
    h(i) = a'*x(i,:)';
  end
  J = (1/(2*m))*sum(((h - y).^2));
  conv(iter) = J;  % conv[iter]
  iter = iter + 1;
end

% convergence plot
figure(2)
plot(conv, 'b')
xlabel("No. of Iterations")
ylabel("Convergence")
title("Convergence Plot")