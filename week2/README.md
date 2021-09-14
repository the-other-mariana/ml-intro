# Notes

## Classification (Supervised)

Find a model (curve) that separates or determines whether a point lies in one category or another. We test whether a data is part of a class or not.

## Regression (Supervised)

(Linear) tell whether or not data follows a line, and if it does, get the equation and therefore estimate further data using that line.

- Anything for prediction is supervised: you construct the model with **previous data (known data)** and tomorrow you will **validate**.

## Clustering (Non-Supervised)

- We test whether a data is part of a class or not. 

- Apparently, classification can seem  similar. But classification (main difference) is a **supervised** method (we know data group beforehand), while clustering is **non-supervised** (we dont know data group beforehand). Also, clustering is focused in grouping data that is **closer** (distance is the criteria to group) to a cluster than to other clusters/centers/centroids. There can be data outside of any cluster, and they are called **noise**.

- Depending on the clustering technique, the centroid can be defined. You also can determine how many centroids or groups, so output can differ.

- **Supervised** and **Non-supervised** are learning/training techniques.

- New information is generated: grouping information into categories that didn't exist before.

----

### Exercise 1: Regression (predictions to what will happen tomorrow, real data, probabilities)

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex01.PNG?raw=true)

### Exercise 2: Classification (whether it will rain or not)

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex02.PNG?raw=true)

### Exercise 3: Classification (whether an account is weak or not)

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex03.PNG?raw=true)

### Exercise 4: b) and c) Non-supervised

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex04.PNG?raw=true)

### Exercise 5: a) and d) Supervised

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex05.PNG?raw=true)

### Exercise 6: b)

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/ex06.PNG?raw=true)

----

## Single-variable Linear Regression

- A model (line) that adjusts to given data in order to make predictions. If a system of costs and area: Given the area, you will now the cost of that house, for example. All the costs are subject to area.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/reg-01.PNG?raw=true)

### The Model

- The line is the best adjustment to data, and it will serve as a model for future houses (future or new data not part of training data).

- h is the hypothesis for each data x_i. This model is Supervised because you have real training data.

    - y is the real price, h is the hypothesis one.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/reg-02.PNG?raw=true)

### Cost Function

- J(a_0, a_1) is a function that measures the **error** of a line according to its training data. The error is the difference between y and h values, that is, the J function estimates the difference between a real price and the predicted one. It involves a squared term in order to:

    1. Eliminate negative differences

    2. Penalize or enlarge big differences more than small differences.

In the image below, x axis **a** is a vector that contains a_0 and a_1.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/reg-03.PNG?raw=true)

- The error behaves as a Unimodal (one mode, max or min value) convex equation (J) and therefore can be minimized, which is our objective: find the a_0, a_1 values that reduce the most the error (J).

### Gradient Descent

- **Gradient Descent** is the method that find these a_0, a_1 that minimize the J function.

    - Requirements: Unimodal funtion and its second-derivative existing.

    - Beta factor: learning factor. It is a constant parameter that you configure at the start of the learning process. It works for accelerating/slowing down the search of a_0 and a_1.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/res/reg-04.PNG?raw=true)


## In Code

Source: https://github.com/the-other-mariana/ml-intro/blob/master/week2/regression.m

### Example Training Data

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week2/out.png?raw=true)