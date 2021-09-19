# Notes

## Stop Criteria

- Error stabilizing: iterate until a pseudo-constant error is reached.

- Maximum iteration: stablish a maximum number of iterations regardless of error.

## Minimizing The J Function: Gradient Descent

- It is preferable to start with a_0 and a_1 as zero, because most of the times we do not have 'visible data' ( too much instances or they are 4+ dimension data).

    - a_0 and a_1 are randomly generated from there at first, and then through the process they will get adjusted. If they are either too large or too small, the iteration process will not achieve very exact results with respect to its training data: even after many iterations the error will not converge.

- Beta: the smaller it is, the slower the process becomes. Beta is a step variable, as it multiplies the derivative in the Gradient Descent.

- Iterations: if the error is still decreasing, it means it is not stabilizing, and therefore, the iterations can be increased and the error reduced.

- It is a deterministic process in general, which means that with same parameters, you will reach the same results at some point.

- `h` will be a vector that contains the predicted y value for each x (training data).

- this algorithm guarantees that with any random initialization (mostly a_0, a_1 = 0), it will arrive at the a_0 and a_1 that minimizes the J function. The only thing would be that it will take sooner or longer depending how close the init values (**initial hypothesis**) are from the right solution and the size of the beta step.

- **Initial Hypthesis**: the first a_0, a_1 values we put before starting the process. Normally, it's zero for both.

- Not converging: it has to do with many factors, but the main problem is beta. It is very common to be too large: J function is a convex function with a parabola-like form. When a_0 and a_1 start to get too large (either positive or negatively), the a axis value is making the J value to clim along the parabola towards infinite values.

    - Reduce beta: add zeros. But if beta is too small, it will take too long! Each time you reduce beta, reduce iterations to find it faster.

- the searching space is too large, the data is too separated and it will not be a very adjusted line.