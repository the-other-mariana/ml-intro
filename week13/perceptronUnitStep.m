clear all
close all

x = [-1 -1;
      1 -1;
     -1 1;
     1 1];
Y = [-1;
      -1;
      -1;
      1];
      
data=load("dataset_Perceptron.txt");
[m,n] = size(data);
x = data(:,1:n-1);
Y = data(:,n);
      
[m,n] = size(x);

% initial hypothesis
b = -0.5;
W = [0.2 0.5];
a = 0.03;

% stop criteria: iterations/epochs
epoch = 1;
epoch_max = 10;

mean_x = mean(x);
sigma = std(x);
for i=1:m
  x_norm(i,:)= (x(i,:)-mean_x)./sigma;
end
x = x_norm;

% plot input data
class_zero = find(Y==0);
class_one = find(Y==1);
figure(1)
hold on
plot(x(class_zero,1), x(class_zero,2), 'ok', 'MarkerFaceColor', 'm', 'MarkerSize', 7)
plot(x(class_one,1), x(class_one,2), 'sk', 'MarkerFaceColor', 'c', 'MarkerSize', 7)
axis([-3 3 -3 3])

xlabel('x1')
ylabel('x2')

% linspace for plotting
x1 = -3:0.1:3;
x2 = (-W(1)*x1 - b)/W(2);
% first line depending on initial hypothesis
plot(x1,x2,'r')

% training process
while (1)
  % there can be parameter update after each training data point
  for i=1:m
    v = W*x(i,:)' + b;
    y(i,1) = s(v);
    if Y(i) ~= y(i)
      W = W + a*x(i,:);
      b = b + a;
      
      % for plot intermediate lines
      x2 = (-W(1)*x1 - b)/W(2);
      plot(x1,x2, 'y')
    end
  end
  error = sum(abs(Y-y));
  conv(epoch) = error;
  if error == 0
    break;
  end
end

% for plot
x2 = (-W(1)*x1 - b)/W(2);
plot(x1,x2, 'g')
figure(2)
plot(conv)

display(["W1 = ", num2str(W(1)), ", W2 = ", num2str(W(2)), ", b = ", num2str(b)])