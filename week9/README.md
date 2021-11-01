# Notes

## Implementation

- `dataset.txt` is not perfectly linearly separable

- `dataset2.txt` is perfectly linearly separable.

- If you do not normalize, the algorithm converges, but in a much longer time lapse.

- x_1 will be the x coordinate, x_2 will be the y coordinate and the class y will decide the color and shape of the point in the scatter plot. Only with two characteristics you can plot the points and the output.

We need again the initial parameters: zeroed vector **a** and beta factor, and the maximum number of iterations (optional depending on stop criteria). **a** must be of size n+1, where n is the number of characteristics (not included x_0 as a characteristic).

J variable is not a metric for determining the amount of accuracy in the prediction compared to **y**, even though J is called the error function. J is in reality an error function that **guides the learning process**, instead of the actual accuracy or measure of performance in the model. To measure the performance of the model, we would need to count how many where classified correclty compared to **y** and how many were wrong and thus give a percentage.

J value then is an error, yes, but does not necessarily mean that the data is wrongly classified. Take this example: image we have a data value that belongs to y = 1 (class 1), and its h(x_i) outputs a 0.9. This 0.9 will give me a value of J, a small one because the probability of belonging to 1 is 0.9, but a value in the end, even though this point is classified correctly according to the rule seen before.

![img](1)

The thing is that if h >= 0.5 and the data point belongs to class 1, the J value will not be zero even though the point is correclty classified. This J will then be accumulated either way: we can classify every data value correclty and still the J value at the end will not be zero.Thus, **J is not an indicator of the accuracy (acceptance/rejection) of the model**, since J is calculated based on h(x_i) which predicts using probabilities. Also, do not expect the Convergence plot completely in zero at y axis as an indicator that the process is finished and accurate. 

- Do not increase iterations because you see a J that is not close to 0.

- Waiting until J error value is stable is good, but it is not an indicator of the process being finished. Anyway, **it is an acceptable stop criteria for Logistic Regression, but you need to know that maybe it could have been earlier the stop point of the process**.

- The only way to know the accuracy is: count how many where classified correclty compared to **y** and how many were wrong and thus give a percentage. By doing this, we can cut the process where we have 100% accuracy and J convergence plot can still be decreasable.

The output of this model being a line that separates the two groups, is not unique: there can be infinite lines that give us a correct classification.

![img](2)

## Forcing errors

You can do the following:

```matlab
beta = 0.00001; % a minimal step
iter_max = 5; % and too little iterations: we will not arrive at a good solution: error forcing
```

![img](errors.png)

*Note: Figure 1 is what it should be (plot according to known **y**) and Figure 3 is what it predicted (plot according to predicted **y** vector).*