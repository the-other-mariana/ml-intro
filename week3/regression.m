% code for linear regression

close all % close windows
clear all % clear variables

% there are usually validating data and training data, for now they will be the same
% data input, data training: divided into two groups
% ; is to avoid dispaly in console, not an error

x = [9, 12, 24, 45, 10.5]; % areas % this data must be normalized (fixed to be near each other) in order to avoid errors
y = [1200, 1520, 2300, 3400, 1370]; % cost (100k), known correct output

figure(1)
plot(x, y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 8) 
hold on % draw on past plots without clearing, until a hold off

% initial parameters

a0 = 0; 
a1 = 0;
beta = 0.001;
iterMax = 500;

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
J
a0
a1

input_data = 20; % must be normalized as well
output_h = a0 + a1*input_data
figure(1)
plot(input_data, output_h, 'ok', 'MarkerFaceColor', 'm', 'MarkerSize', 8) 