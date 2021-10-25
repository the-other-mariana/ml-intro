# Notes

- We say that with the **Gradient Descent** the iterative method stops updating **a** when it reaches the optimized value because the update that **a** receives in each iteration uses the gradient (derivative or slope) reaches a zero value, meaning that a slope of zero is reached, and therefore **a** is unchanged and so on, so that we can say that at the optimization of the process, **a** stops oscilating and reaches a constant value.

- In this case, because we have two features x_1 and x_2, an input test data point **x** needs to have two elements as well, and also an x_0 = 1 added. The two elements (without the x_0 = 1) need to be **normalized** as well with the calculated mean and stdev from the training data.

- The finished model has the value of vector **a** adjusted to minimize the error function. This is where we can input a test value **x** that is used to calculate hypothesis h, with the matrix multiplication of **a** transposed with **x**, and this value is the prediction for **x** using the trained model.

- In most of the ML problems, we will have more than two features and therefore the resulting model will not be a plane anymore, and we will not be able to visualize it.

## Classification Method: Logistic Regression

**Logistic Regression (LR)** is a method used for classification problems, and it will allow us to know whether a data point belongs to one class or another.

- **Multiple classification**: it is a classification problem where we only have more than two possible classes where a data point can belong to. Example: classify images that have handwritten numbers in classes 0-9.

- **Binary Classification**: it is a classification problem where we only have two possible classes where a data point can belong to.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/1.png?raw=true)

In this case, a data point belongs to one class or another depending on its values for all its features, in this course, 2.

Logistic Regres starts from the same principle as Linear Regression, but they are not same technique. With the same principle we mean that the **model** is the same, because both output a **line as a model**, the only difference is that in Linear Regression the line is used to approximate y output given an x, and in Logistic Regression the line is used to separate the data.

The line in a Logistic Regression model is called the **decision line** or **decision limit**. In this way, all data that lies **under** the decision line is classified as class 0 and the data that falls **above** the line would be class 1.

## The Model

The model in Logistic Regression is:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/2.png?raw=true)

If we look at the model, we can see that without the **g()** the model is the same as linear regression (**a**' * **x**), because in both we use a line. Now, **a**' * **x** is transformed with a **g** function. But, **what is g?**

A Logistic Regression problem is not the same as a Linear Regression problem, in the sense that the error does not produce a curve J as in linear regression, where the error was a convex and unimodal (one minimum/maximum) curve J. In a Logistic Regression problem, the error behaves differently: we have a function J that has a lot of local minimums. We do have a global minimum (lowest point), though.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/3.png?raw=true)

What does this imply? Having many local minimum points makes the **gradient descent** not to work, because the gradient descent as we knew it **cannot go further when a zero slope is found**, meaning that it would output the first local minimum found to be the global minimum, which is mistaken. Because **a** is random, the initial J can fall in different local minimum slopes, but the gradient descent will get stuck on the first zero slope it finds, whether is the real global minimum or not. 

Thus, **the gradient descent does not work with this J function**. This is why the solution is to think of a **new J function** where the gradient descent optimization technique works because this new function fills the 2 requirements for the gradient descent:

1. Convex **Unimodal** funtion (U form with only one minimum).

2. Double derivative exists.

This new J function will now depend on h hypothesis. The idea now is that the hypothesis h generates values only between 0 and 1 (two classes), to determine if the evaluated point belongs to class 0 or class 1.

Thus, if the correct output of the current data point is y = 1 (class 1), because this is a **supervised** problem, we would have the information as follows, where y is a binary vector.

| x_0 | x_1 | x_2 | y (class) |
| ---- | ---- | ---- | ---- |
| 1 | 2104 | 3 | 0 |
| 1 | 1600 | 3 | 1 |
| 1 | 2400 | 3 | 1 |
| 1 | 1416 | 2 | 0 |

So, if the current data point belongs to y = 1, we would expect that the hypothesis h outputs 1 as well, and in this situation **the error is 0**. But if in the same data point analysis the hypothesis h outputs a 1, **the error should be inflated** because the prediction is wrong according to its y. This provokes a function:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/4.png?raw=true)

*Note: The hypothesis h belongs to all real numbers between 0 and 1, so it is not discrete but continuous.*

With this function, the gradient descent now can reach the global minimum at the first (and only) slope of zero found. This function has two asymptote.

What happens if we got y = 0? We have **another J error function**. If the current data point analysed is y = 0 class, then we expect that h outputs 0 where the error J would also mean zero. As h gets near 1, the error becomes infinite. This provokes another function:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/5.png?raw=true)

Therefore, we have 2 error J functions, how do we merge them into one where the gradient descent is able to find the global minimum depending on y? The iterative process here is also concerned with updating **a** because it will update h accordingly.

**Conclusion 1: Hypothesis h must be between 0 and 1**. In linear regression, hypothesis h for each point was not between [0,1], it was between [-inf, +inf]. Thus, we need to transform the hypothesis that the line **a**' * **x** generates between [-inf, +inf] to a value between [0,1] in order to be able to determine the prediction of classes 0 and 1. The function that does this transformation froom [-inf, +inf] to [0, 1] is **g function**, also known as **Sigmoid Function**:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/6.png?raw=true)

The sigmoid function, where z =  **a**' * **x**, has the equation:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/7.png?raw=true)

Here, g(z) can be thought of as h. The Sigmoid Function has asymptote on 0 (lower limit) when z is very small and asymptote on 1 (higher limit) when z is very large, where z is the x-axis. Once h is transformed to [0, 1] we can use the new J functions.

Notice that the sigmoid function passes through 0.5 when z = 0. This allows us to take the decision: if z has values [0, +inf], h will output a value between [0.5, 1]; if has values [-inf, 0] then h will output a value between [-1, 0.5]. With h taking this values now, we can apply the following **rule to identify whether a value belongs to class 0 or 1 based on h**:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/8.png?raw=true)

where y' is the predicted class.

Now we can say that h has a range (0, 1), because the sigmoid has asymptotes and never touches 0 or 1. But what tells me to which class the point belongs to is the probability that h provides: if h >= 0.5 then the point has more probability of being from class 1. On the contrary where h < 0.5, the probability is higher for being from class 0. 

- **h = 0.8 indicates us** that the point has 80% **probability** of being class 1 and 20% probability of being class 0.

An exact h = 0.5 means that the data point is probably touching the model line. For each data point you will get a probability h to which class it belongs to. When the training ends, the result is parameter vector **a** adjusted, which generate the line **a**' * **x**, and when you have the line you will calculate the hypothesis h for a test point, and thus you will get the probability of that data test belonging to class 0 or 1 (z [-inf, +inf] tells whether the point is under or above the line), you apply the rule above to actually predict the class.

**Conclusion 2: Hypothesis h must be between 0 and 1 so that we can use a new J function that can be minimized with Gradient Descent**. We reached the conclusion of having two J error functions, one for each behaviour when y changes from 0 to 1:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/9.png?raw=true)

The objective of the training iterations is once again **to modify a** so that we modify h so that we minimize the J function. The objective of the J function is to help minimize using the values of transformed h. How do we unify these functions into one J error function?

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/10.png?raw=true)

The left component corresponds to the first funtion, when y = 1; and the right component corresponds to the second behaviour, when y = 0. As y changes with each data point, the corresponding component of this function will be turned on, while the other will get cancelled by the factor using y. Each logarithm describes the left and right behaviours, ln(h) and ln(1 / h) or ln(1 - h). J basically is, in each iteration, the average of the sum of the errors in said iteration. These two logarithms, these two behaviours, have asymptotes in their corresponding error limit. 

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/11.png?raw=true)

These function will work based on y so that the gradient descent minimizes it: the fact that each component is a logarithm with an asymptote doesnt mean the function never reaches a slope of zero, it actually does. 

- Each error accumulated to J is a single number gotten from the component that is turned on given h. 

- The first few values, because **a** starts as 0, will generate a hypothesis of around 0.5, which is **very prompt to having a mistake because the value lies on the line** and can be of either side.

These two components of the J function will be changing **with every data point you evaluate**, because its y changes.

- For example, we have a data point that gives us h = 0.5, and so we classify it as class 1, when in reality that data point has y = 0. This mistake will generate a big J error value, that will be **summed up** to J, making J(a) bigger, and therefore the gradient descent will reduce a to reduce h so that h gets closer to 0 and to a smaller error, and in the future gets well classified.

## The Gradient Descent

Luckily, the gradient of J(**a**) stays the same because we are using a J function that allows us to still use the Gradient Descent technique:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/12.png?raw=true)

## Summary & Example

- We still need to add x_0 = 1 column because our h is still a line defined by **a**' * **x**.

- J measures how much y' (predicted) differs from y (correct/known). If J(a) is big, then the derivative dJ(a) also grows, and the adjustment of a in the next iteration will be bigger because it got a big error.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week8/res/13.png?raw=true)