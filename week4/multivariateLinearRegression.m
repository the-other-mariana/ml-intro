clear all
close all

x = [1, 2, 3;
     1, 1, 3;
     1, 2, 3;
     1, 1, 2];
     
a = [0, 1, 0.5];
y = [3, 3, 3, 2]; % y will always have the same size as each x in training data
h = [0, 0, 0, 0];
m = numel(y);
[m, n] = size(x); % matrix x must have the x_0 column added for this to be useful

for i = 1:m
  % x(i,:): each row, using all its columns
  % ' is for transposed
  % h is a vector
  % for each hipothesis of each training data x_i: 
  h(i) = a * x(i,:)';
end

J = (1 / (2 * m)) * sum((h - y).^2)