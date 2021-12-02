clear all
close all
      
data=load("dataset_Perceptron.txt");
[m,n] = size(data);
x = data(:,1:n-1);
Y = data(:,n);
      
[m,n] = size(x);

% plot limits
min_val = -3;
max_val = 3;
step = 0.1;

% initial hypothesis
b = -0.5;
W = [0.2 0.5];
a = 0.03;

% stop criteria: when error is 0, epochs used for conv plot
epoch = 1;

% training set normalization
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
axis([min_val max_val min_val max_val])

xlabel('x1')
ylabel('x2')
title("Data Plot")

% linspace for plotting
x1 = min_val:step:max_val;
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
  epoch += 1;
  if error == 0
    break;
  end
end

% for plot
x2 = (-W(1)*x1 - b)/W(2);
plot(x1,x2, 'g')
figure(2)
plot(conv)
xlabel('Epochs')
ylabel('Prediction Error Count')
title("Error Convergence Plot")

display(["Final Parameters after training:"])
display(["W1 = ", num2str(W(1)), ", W2 = ", num2str(W(2)), ", b = ", num2str(b)])

% test input data
x_test = [[34.6237 78.0247]; [60.1826 86.3086]];
Y_test = [0 1];
[r, c] = size(x_test);

% normalize test data with training set mean and stdev
for i=1:r
  x_test_norm(i,:)= (x_test(i,:)-mean_x)./sigma;
end

% test prediction and display
display(["Test data prediction:"])
figure(1)
hold on
for i=1:r
  v_test = W*x_test_norm(i,:)' + b;
  pred = s(v_test);
  display(["Test data point ", num2str(i), ": x1=", num2str(x_test(i, 1)), ", x2=", num2str(x_test(i, 2)), ". Correct class: class ", num2str(Y_test(i)),". Prediction: class ", num2str(pred)])
  % test data plot
  if pred == 0
    plot(x_test_norm(i,1), x_test_norm(i,2), 'ok', 'MarkerFaceColor', 'g', 'MarkerSize', 7)
  else
    plot(x_test_norm(i,1), x_test_norm(i,2), 'sk', 'MarkerFaceColor', 'g', 'MarkerSize', 7)
  end
end