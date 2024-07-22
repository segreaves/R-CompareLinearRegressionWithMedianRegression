# Linear regression comparison to median regression

This project uses simulated data to compare two methodologies: Linear and Median regression. The reason for this is that different situations will warrant different approaches to data modelling and forecasting. This example aims to highlight the differences in fitting a model that optimizes the Mean Squared Error (linear regression) versus one that optimizes the Mean Absolute Error (MAE).
The aim is not to push one method over another, but rather to prompt one to consider in which scenarios one methodology would be preferrable over the other.

![image](https://github.com/user-attachments/assets/5af0ce22-9919-4688-bfde-b78be4f4db44)

The simulated data above is a simple relationshipt of y = b + mx with an added noise element. Note, however, that there is one outlier that falls quite outside the pattern of the rest of the data.
Depending on the data this could be due to error, but it could also be a genuine data point that can (though seldom) occur. One has to consider ways to deal with outliers like this one.

Here we will keep the point in the data and see how robust each method is against the existance of outliers.
The R code uses the 'quantreg' library's rq() function to perform median regression (quantile regression with a tau = 0.5 argument). We also perform a simple linear regression with lm().

![image](https://github.com/user-attachments/assets/0bb0d818-c11d-4d6d-80fa-e4ff61151f21)

Note how the linear regression is more heavily affected by the outlier. This is because the MSE will give much more weight to larger errors due to its squared error term, while the MAE gives less weight to larger terms since it only minimizes the absolute error terms.
Effects like these might seem small but they will add up. When predictions seem to be consistently underperforming in one direction (consistently above or below actual values), consider the effects outlier points may have on your analysis and conclusions.
