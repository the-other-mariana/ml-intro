import numpy as np

f = open("dataset_multivariate.txt", "r")
lines = f.readlines()
m = len(lines)
n = len(lines[0].split(','))

# y gets the last line value, x gets all the rest (matrix)
y = [float(line.split(',')[len(line.split(',')) - 1]) for line in lines]
x = [line.split(',')[:-1] for line in lines]
x = [[float(v) for v in array] for array in x]

# to numpy array for better math operations
y = np.array(y)
x = np.array(x)

# initial parameters
a = np.zeros(n, dtype=float)
beta = 0.1
iterMax = 100

iter = 1

# iterate transposed x so that we can get the columns of original x in a for loop
mean_x = np.array([np.mean(col) for col in np.transpose(x)])
sigma = np.array([np.std(col) for col in np.transpose(x)])

# normalize x
x_norm = np.zeros((len(x), len(x[0])), dtype=float)
for i in range(m):
    sub = (x[i] - mean_x)
    x_norm[i] = np.array([sub[i] / sigma[i] for i in range(len(sigma))])

# add ones column in the beginning
x = x_norm
x = [[1.0] + list(row) for row in x]
x = np.array(x)

h = np.zeros(m, dtype=float)
for i in range(m):
    h[i] = np.matmul(a, x[i, :])

sums = [(h_val - y_val)**2 for h_val, y_val in zip(list(h), list(y))]
J = (1.0 / (2.0 * m)) * sum(sums)
conv = [] # convergence vector
last_J = 0.0
eps = 2.2204e-16

while(1):
    last_J = J
    for j in range(n):
        # element by element multiplication
        sums = (h - y) * x[:, j]
        a[j] = a[j] - beta * (1.0/m) * sum(list(sums))
    for i in range(m):
        h[i] = np.matmul(a, x[i, :])
    sums = [(h_val - y_val) ** 2 for h_val, y_val in zip(list(h), list(y))]
    J = (1.0 / (2.0 * m)) * sum(sums)
    if last_J - J <= eps:
        break
    conv.append(J)
    iter += 1

input_data = np.array([3100, 4])
num = (input_data - mean_x)
norm_input = [num[i] / sigma[i] for i in range(len(num))]
norm_input = [1.0] + norm_input
norm_input = np.array(norm_input)

h_input = np.matmul(a, norm_input)

print("The J Error:", J)
print("Total Iterations:", iter)
print("Input Hypothesis", h_input)
print("Vector a:", a)


