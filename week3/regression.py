import matplotlib.pyplot as plt
import numpy as np

# example training data from file
f = open("dataset.txt", "r")
lines = f.readlines()
x = [float(line.split(',')[0]) for line in lines]
y = [float(line.split(',')[1]) for line in lines]

# example training data
#x = [9, 12, 24, 45, 10.5]
#y = [1200, 1520, 2300, 3400, 1370]

fig = plt.figure()
fig.add_subplot()
ax1 = plt.gca()

ax1.scatter(x, y, s=100, color='yellow',marker="o", linewidths=1, edgecolor='black')

a0 = 0.0
a1 = 0.0
beta = 0.001
iterMax = 500

m = len(x)
iter = 1

h = [(a0 + a1 * x_val) for x_val in x]

ax1.plot(x, h, color='r')
sums = [(h_val - y_val)**2 for h_val, y_val in zip(h, y)]
J = (1.0 / 2.0 * m) * sum(sums)
conv = [] # convergence vector

while iter <= iterMax:
    sums0 = [(h_val - y_val) for h_val, y_val in zip(h, y)]
    a0 = a0 - beta * (1.0 / m) * sum(sums0)
    sums1 = [((h_val - y_val) * x_val) for h_val, y_val, x_val in zip(h, y, x)]
    a1 = a1 - beta * (1.0 / m) * sum(sums1)
    h = [(a0 + a1 * x_val) for x_val in x]

    sums = [(h_val - y_val)**2 for h_val, y_val in zip(h, y)]
    J = (1.0 / 2.0 * m) * sum(sums)
    conv.append(J)
    iter += 1

ax1.plot(x, h, color='g')
ax1.set_title('Univariate Linear Regression')
ax1.set_ylabel("Price")
ax1.set_xlabel("Area")

fig2 = plt.figure()
fig2.add_subplot()
ax2 = plt.gca()

# for convergence plot
min = 0.0
max = iterMax * 1.0
xs = list(np.arange(min, max, max / len(conv)))
ax2.plot(xs, conv, color='orange')
ax2.set_title('Error Convergence')
ax2.set_ylabel("Error (J)")
ax2.set_xlabel("Iterations")

# plot test data and output
input_data = 20
output_h = a0 + a1 * input_data
ax1.scatter([input_data], [output_h], marker='o', color='magenta', s=100, linewidths=1, zorder=100, edgecolor='black')

plt.show()
