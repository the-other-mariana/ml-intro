# Notes

## Stop Criteria

- Error stabilizing: iterate until a pseudo-constant error is reached.

- Maximum iteration: stablish a maximum number of iterations regardless of error.

## Minimizing The J Function: Gradient Descent

- It is preferable to start with a_0 and a_1 as zero, because most of the times we do not have 'visible data' ( too much instances or they are 4+ dimension data).

    - a_0 and a_1 are randomly generated from there at first, and then through the process they will get adjusted. If they are either too large or too small, the iteration process will not achieve very exact results with respect to its training data: even after many iterations the error will not converge.

- Beta: the smaller it is, the slower the process becomes. Beta is a step variable, as it multiplies the derivative in the Gradient Descent.

- Iterations: if the error is still decreasing, it means it is not stabilizing, and therefore, the iterations can be increased and the error reduced.

- `h` will be a vector that contains the predicted y value for each x (training data).

This algorithm guarantees that with any random initialization (mostly a_0, a_1 = 0), it will arrive at the a_0 and a_1 that minimizes the J function. The only thing would be that it will take sooner or longer depending how close the init values (**initial hypothesis**) are from the right solution and the size of the beta step.

- **Initial Hypthesis**: the first a_0, a_1 values we put before starting the process. Normally, it's zero for both.

### A Problem

- Not converging: it has to do with many factors, but the main problem is beta. It is very common to be too large: J function is a convex function with a parabola-like form. When a_0 and a_1 start to get too large (either positive or negatively), the a axis value is making the J value to clim along the parabola towards infinite values.

![image](https://github.com/the-other-mariana/ml-intro/blob/master/week3/res/ML-03_2.jpg?raw=true)

### Solution

**Reduce beta**: add zeros. But if beta is too small, it will take too long! Each time you reduce beta, reduce iterations to find it faster.

- If the searching space is too large in the training data, this means that each training value is too separated from the others. If this happens, no matter how many iterations, the final output will not be a good adjustment model for the data. The solution for this is **data normalization**, which would mean a transformation of the training data in order for the values to be closer in space from one another. There are many techniques, which will be seen later. For now, the 'normalization' will mean to divide the training data x values by 10.

- It is a deterministic process in general, which means that with same parameters, you will reach the same results at some point.

## Output

Source Code (both equivalent verions):

- M: https://github.com/the-other-mariana/ml-intro/blob/master/week3/regression.m

### Regression

![image](https://github.com/the-other-mariana/ml-intro/blob/master/week3/res/outm.png?raw=true)

### Error (J)

![image](https://github.com/the-other-mariana/ml-intro/blob/master/week3/res/errorm.png?raw=true)

- Python: https://github.com/the-other-mariana/ml-intro/blob/master/week3/regression.py

### Regression

![image](https://github.com/the-other-mariana/ml-intro/blob/master/week3/res/out-py.png?raw=true)

### Error (J)

![image](https://github.com/the-other-mariana/ml-intro/blob/master/week3/res/error-py.png?raw=true)

