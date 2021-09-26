# Notes

- If J error plot is still decreasing and is not stable, you can increase the iterations and reduce the error with this given time. To get a better result, choose to do the following:

    1. Reduce beta for accelerating, taking care of convergence: by hand. There are algorithms for adjusting this, but out of course scope.

    2. Increase iterations until error is stable: break the execution when current and past error have a minimum difference.

- The predictions done with **input data** will always lie on the regression line.

- A model with data not linearly related, will have a greater error than one with linearly adjusted training data.

## Multivariate Linear Regression

The majority of problems that need ML are multivariate: the house price is based on not just the area, but also the amount of construction area, bedrooms, parking lots, etc. Here we will continue to use the example of a house price prediction.

| x_0 | Area m^2 (x_1) | Parking Lots (x_2) | # of Rooms (x_3) | # of Bathrooms (x_4) | Price (y) |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 1 | 62 | 1 | 1 | 1 | 800 000 |
| 1 | 140 | 2 | 3 | 2 | 2 600 000 |
| 1 | 98 | 1 | 2 | 1.5 | 1 200 000 |
| 1 | 230 | 2 | 5 | 3 | 3 100 000 |

- m: number of training data. In this case, m = 4 (rows)

- n: number of characteristics or independent variables. In this case, n = 4 (columns)

- In uni-variate regression (linear), x was a vector. Now, each training data is a vector (x_i = [62, 1, 1, 1]) and x is therefore a matrix (the whole table except Price). Thus, the model changes.

> h_a(x_i) = a_0 * x_0,i + a_1 * x_1,i + a_2 * x_2,i + a_3 * x_3,i + a_4 * x_4,i + ... + a_n * x_n,i

where i is the training data index and x_0 = 1. 

The equation for multivariate regression in expanded form would be:



We can add to the information matrix (table) a column that corresponds to what would be x_0, and is composed of only 1's, so that the dimensions of vector **a** transposed (1 x n + 1) can be multiplied by this **x** column vector (n + 1 x 1). Thus, the equation of multivariate regression in compressed vectorial form results in:



Where vector **a** contains the initial hypothesis values defined by the user. The result of the equation is a hypothesis vector **h**, which is the anticipated result from the multiplication of **a** and **x**, for **each** of the training vectors (table rows). 

- For example, if we are performing the hypothesis for training data 1 with an initial vector of **a** being:

```
a = [1, 0, 0, 1, 1]
h_a(x^1) = [1, 0, 0, 1, 1] * [1, 62, 1, 1, 1].transposed() = 1(1) + 1(62) + 0 + 1 + 1 = 65
```

*Note: this multivariate equation can be used for a univariate model as well*

### Another Example


### Cost Function

- Univariate Linear Regression, Cost Function:



- Multivariate Linear Regression, Cost Function:



Now, J depends on vector **a**, where this vector contains [a_0, a_1, ..., a_n].

### Example

Let's code it to see if J = 0.09 is correct.

Source Code: 

Which outputs an h vector as:

```
h = 
    3.5000   2.5000   3.5000   2.0000

J = 0.093750
```

## Summary

- Univariate Linear Regression



- Multivariate Linear Regression



