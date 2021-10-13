

close all 
clear all 


data = load("dataset.txt")


x = data(:,1);
y = data(:,2);

figure(1)
plot(x, y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 5)
xlabel("x: characteristics (house area)")
ylabel("y: correct output (house price)")
title("Data Plot")
hold on 




a0 = 0; 
a1 = 0; 
beta = 0.023; 
iterMax = 600;

m = numel(x);
iter = 1;


h = a0 + a1*x;
plot(x, h, 'r');

J = (1/(2*m))*sum(((h - y).^2));
conv = [];

while(iter <= iterMax)
  a0 = a0 - beta*(1/m)*sum(h - y);
  a1 = a1 - beta*(1/m)*sum((h - y).* x);
  h = a0 + a1*x;
  J = (1/(2*m))*sum(((h - y).^2));
  conv(iter) = J; 
  iter = iter + 1;
end

figure(1)
plot(x, h, 'g')
figure(2)
plot(conv, 'b')
xlabel("Number of Iterations")
ylabel("Error J")
title("Convergence Plot")

input_data = 20;
output_h = a0 + a1*input_data;
figure(1)
plot(input_data, output_h, 'ok', 'MarkerFaceColor', 'm', 'MarkerSize', 8) 
