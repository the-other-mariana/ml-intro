# Notes

## Classification (Supervised)

Find a model (curve) that separates or determines wether a point lies in one category or another. We test whether a data is part of a class or not.

## Regression (Supervised)

(Linear) tell whether or not data follows a line, and if it does, get the equation and therefore estimate further data using that line.

- Anything for prediction is supervised: you construct the model with previous data and tomorrow you will **validate**.

## Clustering (Non-Supervised)

- We test whether a data is part of a class or not. 

- Apparently, classification can seem  similar. But classification (main difference) is a **supervised** method (we know data group beforehand), while clustering is **non-supervised** (we dont know data group beforehand). Also, clustering is focused in grouping data that is **closer** (distance is the criteria to group) to a cluster than to other clusters/centers/centroids. There can be data outside of any cluster, and they are called **noise**.

- Depending on the clustering technique, the centroid can be defined. You also can determine how many centroids or groups, so output can differ.

- **supervised** and **non-supervised** are learning/training techniques.

- New information is generated

----

### Exercise 1: Regression (predictions to what will happen tomorrow, real data, probabilities)

### Exercise 2: Classification (whether it will rain or not)

### Exercise 3: Classification (whether an account is weak or not)

### Exercise 4: b) and c) Non-supervised

### Exercise 5: a) and d) Supervised

### Exercise 6: b) and c)

----

## Single-variable Linear Regression

- A model (line) that adjusts to given data in order to make predictions. If a system of costs and area: Given the area, you will now the cost of that house, for example. All the costs are subject to area.



- The line is the best adjustment to data, and it will serve as a model for future houses (data not part of training data).

- h is the hypothesis for each data x_i. Supervised because you have real training data.

    - y is the real price, h is the hypothesis one.



- J(a_0, a_1) is a function measures the **error** of a line according to its training data. The error is the difference between y and h values, that is, the J function estimates the difference between a real price and the predicted one. It involves a squared term in order to

    1. Eliminate negative differences

    2. Penalize or enlarge big differences more than small differences.

In the image below, x axis **a** is a vector that contains a_0 and a_1.



- The error behaves as a Unimodal (one mode, max or min value) convex equation (J) and therefore can be minimized, which is our objective: find the a_0, a_1 values that generate the reduce error (J).

- **Descendent Gradient** is the method that find these a_0, a_1 minimize the J function.

    - Requirements: Unimodal and second-derivative exists.

    - Beta factor: learning factor. It is a constant parameter that you configure at the start. It works for accelerating/slowing down the search of a_0 and a_1.

