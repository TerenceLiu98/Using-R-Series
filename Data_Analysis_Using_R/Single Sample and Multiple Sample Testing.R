## Single Sample t-test ##

# Example

daily.intake <- c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)
# data input: eleven females daily energy input(kilojoule)

mean(daily.intake) # mean of the data
sd(daily.intake) # standard deviation of the data

## The recommand intake is 7725 kilojoule, we assume that this data follow the Normal distribution,
# we want to check if this distribution follow \mu = 7725, we need t-test:
t.test(daily.intake, mu = 7725)

# This is the output:

# One Sample t-test
# means: the type of test

# data:  daily.intake
# data set's name

# t = -2.8208, df = 10, p-value = 0.01814
# t statistic, degree of freedom and the p-value;
# In this test, p-value smaller than 0.05, then, the data
# daviate the null hypothesis: \mu = 7725

# alternative hypothesis: true mean is not equal to 7725
# Here is the null hypothesis and the Two-tailed test

# 95 percent confidence interval:
#   5986.348 7520.925
# The true mean's 95% confidence interval

# sample estimates:
#   mean of x
# 6753.636
# sample's estimates
mu0 <- 7725
SEM <- sd(daily.intake) / sqrt(length(daily.intake))
t <- (mean(daily.intake) - mu0) / SEM
confidence_mu0 <- c(mu0 - 2 * SEM, mu0 + 2 * SEM)
confidence_mu <- c(mean(daily.intake) - 2 * SEM, mean(daily.intake) + 2 * SEM)

## Two Sample t.test
library(ISwR)
attach(energy)
head(energy)
t.test(expend~stature)
# expend and stature connected with a tilde means that "Expend" is described by "Stature"

# Welch Two Sample t-test
#
# data:  expend by stature
# t = -3.8555, df = 15.919, p-value = 0.001411
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -3.459167 -1.004081
# sample estimates:
#   mean in group lean mean in group obese
# 8.066154           10.297778
