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
      
[m,n] = size(x);

% initial hypothesis
b = 0.5;
W = [0.5 0.8];
a = -0.5;

% stop criteria: iterations/epochs
epoch = 1;
epoch_max = 10;

% plot input data
class_neg_one = find(Y==-1);
class_one = find(Y==1);
figure(1)
hold on
plot(x(class_neg_one,1), x(class_neg_one,2), 'ok', 'MarkerFaceColor', 'm', 'MarkerSize', 7)
plot(x(class_one,1), x(class_one,2), 'sk', 'MarkerFaceColor', 'c', 'MarkerSize', 7)
axis([-1.5 1.5 -1.5 1.5])

xlabel('x1')
ylabel('x2')

% linspace for plotting
x1 = -1.5:0.1:1.5;
x2 = (-W(1)*x1 - b)/W(2);
% first line depending on initial hypothesis
plot(x1,x2,'r')

% training process
while epoch <= epoch_max
  % there can be parameter update after each training data point
  for i=1:m
    v = W*x(i,:)' + b;
    y(i,1) = f(v);
    if Y(i) ~= y(i)
      W = W + a*x(i,:);
      b = b + a;
      
      % for plot intermediate lines
      x2 = (-W(1)*x1 - b)/W(2);
      plot(x1,x2, 'y')
    end
  end
  error = sum(abs(Y-y))/2;
  conv(epoch) = error;
  epoch += 1;
end

% for plot
x2 = (-W(1)*x1 - b)/W(2);
plot(x1,x2, 'g')
figure(2)
plot(conv)

