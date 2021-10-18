# Notes

Last time, what we did involved a MLR with a beta value very small (0.00000001) and we increased also the number of iterations (150), so that error J was decreased the most.

The problem with these adjustments was because of the **training data**. Consider the image:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/02.png?raw=true)

The training data plotted shows that for characteristic x_2 the range is [0,5] and for characteristic x_1 [0,5000]. These ranges between characteristics differ significantly. This difference is quite inconvenient: 

1. Slows down the process of searching for an optimal **a** vector.

2. By doing this, we are giving more weight to x_1 due to its higher values, which can result in an **unbalaced final model**. This is because we are giving more priority to one characteristc than another in the computation of the hypothesis h, when vector **a** multiplies vector **x_i**: a_1 * x_1 will be a much bigger factor than a_2 * x_2 and **the sum will be more affected by x_1 than with x_2**; this difference in the sum is so big that the model might even look like **univariate**, because x_2 is not providing any significant weight compared to x_1, leaving us with only one characteristic. The **error J** in this case of unbalaced model would **not be affected**, because the model would simply be adjusted to the characteristic x_1. Thus, the model would be approximating the output values based almost solely on x_1. W

Thus, in order to have a balanced model, we need that **all characteristics influence equally** the computation of the hypothesis h. That is why we need to **normalize** the input data of all characteristics or features: make them all to be in the same range. We could simply adjust the initial hypothesis **a** to reduce this effect or the parameter beta to be very very small, but the algorithm becomes very slow in trying to find a balanced **a** vector, so the problem persists.

> Note: the J error function has a parabola form, and during the learning process, as the **a** vector is optimized, the error J is approaching the lowest part of the parabola. If we have an enormous amount of iterations, can **a** pass the lowest point and go to the other high side of the parabola? The answer is no, no matter the iterations, **a** cannot increase again once the lowest point is reached. This is because once **a** reaches the lowest point (optimized), the gradient (slope) with which **a** is updated in each iteration is cero or almost cero, and the output for J, which is **a** updated, is not changing due to this small gradient. It updates with almost cero change, and J also moved along the parabola with almost cero change and so on.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/03.png?raw=true)

> Note: at the end, the value of J might reach a very big amount (1e10), which might look strange but it's important to note that **J value is the average of the quadratic error sum of all iterations**, it is not a +/- value that you can add/substract to the final predicted test value because it does not represent a confidence interval. J is normally big, even with normalized data. There are other metric for computing a +/- error.

Before, we had a beta value very small (0.00000001), which means that each iteration's update on **a** are very small, which means a slow learning process to reach the optimized values of **a**, and error J might stay at a reducible point at the end of the iterations, because we did not have spare time to refine the error.

Therefore, we need to apply a normalization transformation in order to get a coherent/balanced model in less time. The normalization that we will apply is the **standard normalization**, where the trasnformation to each training data value of each characteristic is:

![\Large x'_{i}=\frac{x_{i}-\overline{X}}{S}](https://latex.codecogs.com/svg.latex?\Large&space;x'_{i}=\frac{x_{i}-\overline{X}}{S})

Where the mean and standard deviation used for x_i are computed for **each feature** (column), and therefore it is a computation of **samples**.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/04.png?raw=true)

Important: x_0 column should not be normalized. Now, we can see the training data normalized:

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/01.png?raw=true)

We can see that after the standard normalization, the training data has for each characteristic almost the same range of values. Also, as seen in the image, the transformation does not affect the structure of the data, does **not affect the original data distribution**, the only thing that is affected is the range of values of each feature. 

> We do not normalize Y values, because the normalization only applies to training data, and Y is not part of the training data.

We used to have a beta value very small (0.00000001), and if we increased it to 0.1, for example, the J error diverged because beta was so big that the **a** values made the parabola reach infinites. Now, after normalization, we can have easily a beta = 0.1 and it converges to a small J error. It converges in a very short time (40 iterations), with a smaller final J, as well as having a reasonable beta value.

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/05.png?raw=true)

We see at the end that with beta = 0.1 the model ends up as follows (plane).

![img](https://github.com/the-other-mariana/ml-intro/blob/master/week7/res/06.png?raw=true)

## Conclusions

- If training data is not normalized, the process takes too long to converge, because some ranges might be big and takes longer to adjust **a** from 0 to those values.

- When can we avoid normalizing the training set? we can avoid normalizing if and only if our training set has **both** the following characteristics:

    - The data has **small value ranges** (-3,3) or (-5,5) in **all features**.

    - The **ranges** of each feature does **not differ significantly** from all the others.

- The purpose of normalizing the training set is to:

    - Accelerate the learning process.

    - Balance the influence of all features equally in the final model.

- To get a better model, instead of constant maximum number of iterations (1) or checking if an error is smaller than a constant threshold (2), we can better stop the process when the **error stops changing (difference either 0 or eps)** (3). These three are the different stop criteria.