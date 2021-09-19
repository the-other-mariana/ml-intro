# Notes

## Stop Criteria

- Error stablelizing

- Constant Error

- Maximum iteration

## Minimizing

- a_0 and a_1 are randomly generated at first, and then trough the process they will get adjusted. If they are either too large or too small, the iteration process will not achieve very exact results with respect to its training data.

- beta: the smaller it is, the slower the process becomes.

- iterations: if the error is still decreasing, it means it is not stablelizing, therefore, the iterations can be increased.

- It is a deterministic process in general, which means that with same parameters, you will reach the same results.

- h will be a vector that contains the predicted y value for each x (training data).

- this algorithm guarantees that with any random initialization, it will arrive at the a_0 and a_1 that minimizes the J function. The only thing would be that it will take sooner or longer depending how close the init values (initial hypothesis) are from the right solution.

- Initial Hypthesis: the first a_0, a_1 values we put before starting the process. Normally, it's zero for both.

- Not converging: it has to do with many factors, but the main problem is beta. It might be too large: J function is a convex function with a parabola-like form. When a_0 and a_1 start to get too large, the a axis is climbing along the parabola towards infinite values.

    - Reduce beta: add zeros. But if beta is too small, it will take too long! Each time you reduce beta, reduce iterations to find it faster.

- the searching space is too large, the data is too separated and it will not be a very adjusted line.