################################################################################
# Author: Simon Greaves
# Purpose: A comparison of performance for linear and median regression in the
# context of outliers.
################################################################################

# load libraries
pkgs <- c('ggplot2', 'quantreg')
inst <- lapply(pkgs, inst, character.only = TRUE)

# data simulation parameters
set.seed(42)
n <- 100
# independent
x <- rnorm(n, mean = 10, sd = 10)
# dependent
slope <- 1
intercept <- 1
noise <- rnorm(n, mean = 0, sd = 1)
y <- intercept + slope * x + noise

# create simulated data frame
df <- data.frame(x = x, y = y)
# modify point to be an outlier
max_x_location <- which.max(df$x)
df$y[max_x_location] <- 5

# linear regression model
linear_model <- lm(y ~ x, data = df)

# median regression model
median_model <- rq(y ~ x, data = df, tau = 0.5)

# regression lines
plotting_x <- data.frame(x = seq(min(df$x), max(df$y), length.out = n))
linear_pred <- data.frame(x = plotting_x, model = 'linear_pred', y = predict(linear_model, newdata = plotting_x))
median_pred <- data.frame(x = plotting_x, model = 'median_pred', y = predict(median_model, newdata = plotting_x))
regression_lines <- rbind(linear_pred, median_pred)

# plot the data and the two regression lines
ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_line(data = regression_lines,
            aes(x = x, y = y, color = model, linetype = model), size = 1) +
  scale_color_manual(name = "Model",
                     values = c("linear_pred" = "blue", "median_pred" = "red"),
                     labels = c("Linear", "Median")) +
  scale_linetype_manual(name = "Model",
                        values = c("linear_pred" = "dashed", "median_pred" = "solid"),
                        labels = c("Linear", "Median")) +
  labs(title = 'Linear vs Median Regression', x = 'X', y = 'Y') +
  theme(legend.position = c(0.1, 0.9))
