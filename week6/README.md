# Notes

## Differences Between ULR and MLR

### Hypothesis (a)

In univariate linear regression (ULR), we just had a_0 and a_1.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/01.png?raw=true)

Now, in multivariate linear regression (MLR), we have a vector **a**, which contains a_0, a_1, a_2, ..., a_n, where n is the number of characteristics.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/02.png?raw=true)

And every value of **a** accompanies one characteristic from **x** in the h equation. Thus, we have characteristics x_1, x_2, ..., x_n and we needed to add an extra x_0 = 1, in order to be able to multiply vectors **a** x **x** so that every value of **a** accompanies one characteristic from **x**, like mentioned.

x_0 = 1 is **not** a characteristic, where are just adding it to complete the size of vector **x**.

**X** in reality is a matrix, where each row of that matrix represents a single training data value, which is what we have been calling **x**, formatted as a vector.

### Cost Function J

Now, the Cost Funtion is an error function, that when talking about univariate linear regression depends only on a_0 and a_1.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/03.png?raw=true)

In the case of multivariate linear regression, J (error) depends now on vector **a**, which has more than two elements, becoming multivariate. Both hypotheses h in ULR and MLR end up being a single number per training data x_i, but the way we reach this h(x_i) changes as we saw before.

### Updating The Parameters of a

In ULR we updated in each iteration the values of a_0 and a_1 using the technique of the Gradient Descent:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/04.png?raw=true)

where each value a_j was updated using a learning factor beta and the partial derivative of J(a_0, a_1) with respect to a_j, and j = {0, 1}.

Now, in MLR the Gradient Descent looks very similar, we still update each a_j with a learning factor beta and the partial derivative of J(**a**) with respect to a_j, but with j = {0, ..., n}. This means that we must differentiate J(**a**) with respect to each a_j to update each a_j.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/05.png?raw=true)

If we take a look at the derivatives of J(**a**) with respect to a_j, we notice that the only thing that changes between a_j's is the term x_i,j. In other words, if we are doing a_1 for training data i, we will multiply it by x_i,1. j iterates the characteristics and i the training data values.

We will have an a value for each characteristic, if we include x_0 = 1.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/06.png?raw=true)

which for a_0 would be

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/08.png?raw=true)

- Example

If we have **X** and **y**, we will generate a vector **h** with the hypotheses for each training data value (rows of **X**, or vector **x_i**), which are like approxiamtions for **y**.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/07.png?raw=true)

We also have a constant vector **a** for this data set, which has values for each characteristic including x_0, so **a** = [a_0, a_1, a_2].

So, for the first iteration, imagine we are updating a_0:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/09.png?raw=true)

Only by changing **x_0** vector for **x_j** vector. In this way, we are updating each value of **a**. At the end, **a** will have the values a_0 ... a_n that minimize the J(**a**) function.

In this way, in one iteration we use the same vectors **h** and **y**. After updating all a_0, a_1 and a_2 (vector **a**), we will recompute the new hypothesis **h** again.

In ULR we would get h(x_i) = a_0 + a_1 * x_i, which was a **line**. Now, in the case of this example (2 characteristics), we will have h(x_i) = a_0 + a_1 * x_1,i + a_2 * x_2,i (**a**' * **x**) which is a **plane**. If we had more characteristics, we would be getting a hyper plane (3 characteristics) and so on.

## Implementation

Source: https://github.com/the-other-mariana/ml-intro/blob/master/week6/multivariateLinearRegression.m

### 1st Iteration

- beta = 0.0001

- iterMax = 10;

- Cannot plot J error: data values greater than float capacity (J is increasing and taking infinite values).

- Note: J is normal to be big: is the sum of all errors of all iterations.

What we need to do after the first iteration disaster is to **adjust beta** , and then config the iterations. 

### Following Adjustments

For the next try, the config is b = 0.000001 and iterMax = 10.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/b000001it10.PNG?raw=true)

For the next try, the config is b = 0.000000001 and iterMax = 10.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/b000000001it10.PNG?raw=true)

For the next try, the config is b = 0.00000001 and iterMax = 100.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/b00000001it100.PNG?raw=true)

For the next try, the config is b = 0.00000001 and iterMax = 10 000. Here we observe in J Plot that the error stabilizes (starts to go horizontal at the same Y value) around 150 iterations.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/b00000001it10000.PNG?raw=true)

For the last try, the config is b = 0.00000001 and iterMax = 150.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week6/res/b00000001it150.PNG?raw=true)