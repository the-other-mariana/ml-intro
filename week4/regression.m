% code for linear regression using training data set file

close all % close windows
clear all % clear variables

%training data
data = load("dataset.txt")

% data is a matrix of 97 rows and 2 cols
x = data(:,1);
y = data(:,2);

figure(1)
plot(x, y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 5)
xlabel("x: characteristics (house area)")
ylabel("y: correct output (house price)")
title("Data Plot")
hold on 


% initial parameters

a0 = 0; % 1
a1 = 0; % 1
beta = 0.023; % change this
iterMax = 600; % change this

% size of training data
m = numel(x);
iter = 1;

% hypothesis: vector result called h
h = a0 + a1*x;
% if you dont plut markers, it will be plotted as line
plot(x, h, 'r');

% sum sums all vector elements
% . for element by element operation
J = (1/(2*m))*sum(((h - y).^2));
conv = [];

while(iter <= iterMax)
  a0 = a0 - beta*(1/m)*sum(h - y);
  a1 = a1 - beta*(1/m)*sum((h - y).* x);
  h = a0 + a1*x;
  %plot(x, h, 'g')
  %pause(1)
  J = (1/(2*m))*sum(((h - y).^2));
  conv(iter) = J;  % conv[iter]
  iter = iter + 1;
end

figure(1)
plot(x, h, 'g')
figure(2)
plot(conv, 'b')
xlabel("Number of Iterations")
ylabel("Error J")
title("Convergence Plot")

input_data = 9.7687; % must be normalized as well
output_h = a0 + a1*input_data;
figure(1)
plot(input_data, output_h, 'ok', 'MarkerFaceColor', 'm', 'MarkerSize', 8) 

fprintf('J = %.4f a0 = %.4f a1 = %.4f \nTest: \nx = %.4f y= 7.5435 h = %.4f \n', J, a0, a1, input_data, output_h)