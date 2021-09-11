% code for linear regression

close all % close windows
clear all % clear variables

% there are usually validating data and training data, for now they will be the same
% data input, data training: divided into two groups
% ; is to avoid dispaly in console, not an error

x = [90, 120, 240, 450, 105]; % areas
y = [1200, 1520, 2300, 3400, 1370]; % cost (100k)

plot(x, y, 'ok', 'MarkerFaceColor', 'y', 'MarkerSize', 8) 