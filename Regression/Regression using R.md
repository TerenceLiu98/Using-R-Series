# Regression Using R

This document's main content is about **Linear Regression**, which is a very simple approach for supervised learning.

We will use the *Advertsing* data set.

```{r}
advertsing <- read.csv("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv", header = TRUE)
```

Suppose that in our role as statistical consultants we are asked to suggest, on the basis of this data, a marketing plan for next year that will result in high product sales. Here is some problem we have to solve.

1. Is there a relationship between advertising budget and sales?

2. How strong the relationship between the advertising budget and sales?

3. Which kinds of media can premote sales?

4. How accurately can we estimate the effect of each medium on sales?

$\vdots$

## Simple Linear Regression

Just like its name, it is a very simple model: just clarify the relationship between single independent variable ($Y$) and one dependent variable ($X$). In statistics, the relationship can be written:

$Y \approx \beta_0 + \beta_1 X$

$\approx$ means the it is "approximatly modeled". We will sometimes describe by saying that we are regressiong $Y$ on $X$, in this example, $X$ represent "TV" adertising and $Y$ may represent "sales", then we can regress "sales" on "TV" by fitting the model

$\text{ sales } \approx \beta_0 + \beta_1 \times \text{ TV }$

$\beta_0$ and $\beta_1$ are two unknown constants that represent the **intercept** and **slope** terms in the linear model. Together, $\beta_0$ and $\beta_1$ are known as the model *coefficients** or *parameters*. Once we have used our training data to produce estimates $\hat{\beta}_0$ and $\hat{\beta}_1$ for the model coefficients, we can predict future sles on the basis of a particulatr value of TV advertising by computing

$\hat{y} = \hat{\beta}_0 + \hat{\beta}_1 x$

where $\hat{y}$ indicates a prediction of $Y$ on the basis of $X = x$. Here we use a hat symbol $\hat{}$ to denote the estimated value for an unknown parameter or coefficient, or to denote the predicted value of the response.

### Estimating the Coefficients

In practice, we have a basic method to estimate these coefficients: **Least Square Method**. In the Advertising example, this data set consists of the TV advertising budget and product slaes in $n = 200$ different markets. Our goal is to obtian coefficient estimates $\hat{\beta}_0$ and $\hat{\beta}_1$ such that the linear model fits the available data well -- that is, so that $y_i \approx \hat{\beta}_0 + \hat{\beta}_1 x_i$ for $i = 1,2,\dots,n$. In other owrds, we want to find an intercepnt $\hat{\beta}_0$ and a slope $\hat{\beta}_1$ such that the resluting line is as close as possible to the $n = 200$ data points. There are a number of ways of measuring *closeness*.

[![Screenshot 2018-11-05 at 15.13.47.png](https://i.loli.net/2018/11/05/5bdfedb0001c1.png)](https://i.loli.net/2018/11/05/5bdfedb0001c1.png)

For the Advertsing data, the least sqaures fit for the regression of sales onto TV is shown. The fit is found by minimizing the sum of squared errors.

Let $\hat{y}_i = \hat{\beta_0} + \hat{\beta_1} x_i$ be the prediction for $Y$ based on the $i$th value of $X$. Then $e_i = y_i - \hat{y}_i$ represents the $i$th *residual* -- this is the difference between the $i$th observed response value and the $i$th response value that is predicted by ourlinear model. We define the **residual sum of squares (SSR)** as

$ \text{ SSR } = e_i^2 + e_i^2 + \dots + \e_n^2$

or equivalently as
