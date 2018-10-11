# Linear Regression Analysis - Simple Linear Regression

## What is Regression and Correlation

> The word correlation is used in everyday life to denote some form of association.
> We might say that we have noticed a correlation between foggy days and attacks of wheeziness.  
> However, in statistical terms we use correlation to denote association between two
> quantitative variables. We also assume that the association is linear, that one variable
> increases or decreases a fixed amount for a unit increase or decrease in the other.
> The other technique that is often used in these circumstances is regression, which  
> involves estimating the best straight line to summarise the association.
> From <a href=" https://www.bmj.com/about-bmj/resources-readers/publications/statistics-square-one/11-correlation-and-regression"> Correlation and Regression </a>

All the things in the world has their's own distribution. When we say: Sun rises from the north, that means the probability of "Sun rises from the west" is $0$. Regression analysis is the way we can use to find out the distribution.
**Correlation is only concerned with strength of the relationship and there is no causal effect is implied with Correlation**

## Regression Analysis

* Regression analysis is used to:

  * Predict the value of a dependent variable based on the value of at least one **independent variable**
  * Explain the impact of changes in an independent variable on the dependent variables

* Three basic assumption

  * $X = \{x_1, \dots, x_n \text{ is non random variable (independent variable) }$

  * $\epsilon \sim N(0,\sigma^2),\ \{ \epsilon_1,\dots,\epsilon_2\} \text{  are  } i.i.d., E(\epsilon_i) = 0, Var(\epsilon_i)= \sigma^2$

  * $E(\epsilon_i)= 0 \  <br>
    Cov(\epsilon_i, \epsilon_j) = \sigma^2 \ (i = j)$ <br>
    $Cov(\epsilon_i, \epsilon_j) = 0 \ (i \neq j)$

## Simple Linear Regression

### Parameter Estimation

the simple linear regression model form is $y_i = \beta_0 + \beta_1 x + \epsilon_i$, according to the assumptions we can noticed that $y_i$ is also follow the Gaussian distribution: $y\sim N)\beta_0+\beta_1 x, \sigma^2)$. We can easily get this conclusion by calculate both sides' expectation and variance.
$$
  \begin{align*}
    E(y_i) &= E(\beta_0 + \beta_1 x_i) + E(\epsilon_i) \\
    E(\beta_0 &+ \beta_1 x_i) = constant \text{ and } E(\epsilon_i) = 0 \\
    E(y_i) &= \beta_0 + \beta_1 x_i
    \end{align*}
 $$

As we have mentioned, the **Regression Analysis** is a function to predict or estimate the dependent variable, we need to give out a function: $y_i = \beta_0 + \beta_1 x_i + \epsilon_i i = 1,2,\dots,n$. And the correlation coefficient is $\beta_0$ and $\beta_1$

#### The Least Square Point Estimates ( Using the Least Square Method)
Using the regression analysis, we can use the known data to predict the future data, but what is known data ? <br>
| NO | height | weight |
| :--: | :--:  | :--:  |
|1|      58|       115|
|2|      59|       117|
|3|      60|       120|
|4|      61|       123|
|5|      62|       126|
|6|      63|       129|
|7|      64|       132|
|8|      65|       135|
|9|      66|       139|
|10|     67|       142|
|11|     68|       146|
|12|     69|       150|
|13|     70|       154|
|14|     71|       159|
|15|     72|       164|<br>
Assume that we get this data, frist, we can plot the data in scatter diagram form:
[![Screenshot 2018-10-02 at 02.37.43.png](https://i.loli.net/2018/10/02/5bb26974a079a.png)](https://i.loli.net/2018/10/02/5bb26974a079a.png)
We can see that the dots is nearly in one line, then we can get a hypothesis: the women's weight and women's height is in a positive linear correlation. We can give a prediction line:
[![Screenshot 2018-10-02 at 02.37.56.png](https://i.loli.net/2018/10/02/5bb26974d03be.png)](https://i.loli.net/2018/10/02/5bb26974d03be.png)

We can find that, there are some gaps between Observed Values  and Predicted Values(on the red line), these gaps we called it random error, yes, it is the $\epsilon_i$. As Statistics is always dealing with the un-certain data, this random error, is also uncertain. However, we can use some mathematical method to reduce the error: **Least Square Method**. How can this method to reduce the random error, as we can notice, $\sum^n_{i=1}\epsilon_i = \sum^n_{i=1}E(y_i|e_i)$, we should make $\sum^n_{i=1}E(y_i|e_i)$ the least. When we are trying to find the extreme value, we will think of derivative. If we choose $\sum^n_{i = 1} |E(y_i|x_i)|$ it is difficult for us to do the derivative, so, we choose $\sum^n_{i = 1} (E(y_i|x_i))^2$. To find out the minimum of $\sum^n_{i = 1} (E(y_i|x_i))^2$ is actually find out the minimum of $\sum^n_{i = 1} (\beta_0 + \beta_1 x))^2$. We assume that this function is $ f(\beta_0, \beta_1)$, for the function has more than one variables, we can use partial derivative to get the extreme value. Here is the conclusion:
$$
  \begin{align}
    &\hat{\beta_1} = \frac{\sum^n_{i = }(x_i - \bar{x})(y_i - \bar{y})}{\sum^n_{i = 1}(x_i - \bar{x})^2} \\
    &\hat{\beta_0} = \bar{y} - \hat{\beta_1} \bar{x}
  \end{align}
$$
Why we are written in $\hat{\beta_0}$ and $\hat{\beta_1}$ ? Because they are no longer symbol, but two **exact numbers**.

#### Maximum Likelihood Estimation (MLE)

We have mentioned that $\epsilon$ is following a gaussian distribution, and since $y_i$ is one of $\epsilon$'s linear combination ($x_i$ are not random variable) $\Rightarrow$ $y_i$ follows the gaussian distribution.<br>
The PDF of $y_i$ is:
$$
  \begin{align*}
    f_i(y_i) = \frac{1}{\sqrt{2\pi}\sigma} exp\{-\frac{1}{2\sigma^2}[y_i - (\beta_0 + \beta_1 x_i)]^2\}  
  \end{align*}
$$
The Likelihood function is :
$$
  \begin{align*}
    L(\beta_0,\beta_1,\sigma^2) = \prod^n_{i = 1} f_i(y_i) = (2\pi\sigma^2)^{-\frac{n}{2}} exp\{(\frac{1}{2\sigma^2}\sum^n_{i=1}[y_i - (\beta_0 + \beta_1 x_i)]^2\}
  \end{align*}
$$
This likelihood function can not be calculate by human, so we get $log$ for both sides:
$$
  \begin{align*}
    ln (L) = -\frac{n}{2}ln(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum^n_{i=1}[y_i - (\beta_0) + \beta_1 x_i)]^2
  \end{align*}
$$
We are doing the maximum likelihood estimation, which means we need to maximize $L$ $\Rightarrow \ ln(L)$, which actually, we are minimize the $\displaystyle{\sum^n_{i=1}[y_i - (\beta_0 + \beta_1 x_i)]^2}$ **IT IS THE SAME AS THE LSM**. For $\sigma^2$, we can consider it as a variable, this will makes the question much easier $\hat{sigma} = \frac{1}{n}\displaystyle{\sum^n_{i=1}e_i^2}$ <br>
$\hat{\beta_0},\ \hat{\beta_1}$ is the same as the prious and $e_i = y_i - \hat{y_i}$

#### Matrix Algebra isn Estimation for Regression Model
First, let us make sure we are in the same channel: we assume that $A$ is a matrix and $A = (a_{ij}:n \times p)$ <br>
The **Transpose** of $A$ is $A'\text{ or } A^T : p \times n$ <br>
If $A$ is a  **Square matrix**, $A$ is $n \times n$ matrix <br>
The **Row vector** $a = (a_1,\dots,a_p):\ 1\times p$ <br>
The **Column vector** $a = (a_1,\dots,a_n)^T:\ n\times 1$ <br>
If $A$ is a **Symmetric matrix**, $A = A^T$ <br>
If $A$ is a Diagonal Matrix, $A = \begin{pmatrix} a_1 & & \\ & \ddots & \\& & a_n \end{pmatrix} = diag(a_1, \dots, a_n)$ <br>

Ok, They we are going to review the derivatives of a Matrix. <br>
If there is a function, a multivariate function $f(x_1,\cdots,x_n) = f(\mathbf{x})$, in this function, $\mathbf{x} = (x_1,\dots,x_n))^T$, so the derivatives of $f$ with respect to $x$ is a $n$ dimentional matrix:
$$
  \begin{align*}
    \nabla f = \frac{\partial f(x)}{\partial x}
		  = \begin{pmatrix}
				  \frac{\partial f(x)}{\partial x_1} \\
				      \vdots \\
				          \frac{\partial f(x)}{\partial x_n} \\
		     \end{pmatrix} \qquad
  \end{align*}
$$

Now, let us think about the **quadratic forms' derivative**. <br>
What is the quadratic form? For any quadratic form we always can express it as the matrix form of $\mathbf{x'Ax}$. This means any quadratic polynomial equations can be written is a matrix form: $\mathbf{x'Ax}$. $\mathbf{A}$ is a $n \times n$ constant matrix, which written in this form $A=\begin{bmatrix}c_1 & \cdots & c_n \end{bmatrix}=\begin{bmatrix}r_1 & \cdots & r_n \end{bmatrix}^T$, $c_i$ is the column vector and $r_i$ is the row vector.
$$
  \begin{align*}
  \nabla f = \frac{\partial (x^TAx)}{\partial x}
   = \begin{bmatrix}
      (r_1^T + c_1^T)x \\
      \vdots \\
      (r_n^T + c_n^T)x \\
     \end{bmatrix}
    = \left( \begin{bmatrix} r_1^T \\ \vdots \\ r_n^T \end{bmatrix} +
    \begin{bmatrix} c_1^T \\ \vdots \\ c_n^T \end{bmatrix} \right) x
    = (A + A^T)x   
  \end{align*}
$$
In particular, if $A$ is a symmetric matrix $\frac{\partial (x^TAx)}{\partial x} = 2\mathbf{Ax}$

Ok, now we can talk about the matrix form of the regression. In Simple linear gression model, there is only one $x$, one independent variable, but in the reality, there may be thousands of independent variables. For example, there are two $x$: $x_1$,$x_2$, and we have collected 5 data :
$$
  \begin{align*}
    y_1 = \beta_0 + \beta_1x_{11} + \beta_2x_{12} + \epsilon_1 \\
    y_2 = \beta_0 + \beta_1x_{21} + \beta_2x_{22} + \epsilon_2 \\
    y_3 = \beta_0 + \beta_1x_{31} + \beta_2x_{32} + \epsilon_3 \\
    y_4 = \beta_0 + \beta_1x_{41} + \beta_2x_{42} + \epsilon_4 \\
    y_5 = \beta_0 + \beta_1x_{51} + \beta_2x_{52} + \epsilon_5 \\
  \end{align*}
$$
We can use matrix form to  simplify these polynomial:
$$
\overrightarrow{y} =
\begin{bmatrix}
  y_1 \\
  y_2 \\
  y_3 \\
  y_4 \\
  y_5
\end{bmatrix},\quad X =
\begin{bmatrix}
1 & x_{11} & x_{12} \\
1 & x_{21} & x_{22} \\
1 & x_{31} & x_{32} \\
1 & x_{41} & x_{42} \\
1 & x_{51} & x_{52}
\end{bmatrix},\quad \overrightarrow{\beta} =
\begin{bmatrix}
  \beta_0 \\
  \beta_1 \\
  \beta_2
\end{bmatrix},\quad \overrightarrow{\epsilon} =
\begin{bmatrix}
  \epsilon_1 \\
  \epsilon_2 \\
  \epsilon_3 \\
  \epsilon_4 \\
  \epsilon_5
\end{bmatrix}
$$
Then the linear model can be expressed as:
$$\overrightarrow{y} = X\overrightarrow{\beta} + \overrightarrow{\epsilon}$$
Just like the prious, we need $epsilon$ to be the minimum:$\epsilon ^ 2 = \epsilon^T\epsilon$
$$
  \begin{equation*}
    \begin{split}
    \epsilon^{T}\epsilon & = (y - X\beta)^T(y - X\beta)\\
     & = (y - X\hat{\beta} + X\hat{\beta} -X\beta)^T (y - X\hat{\beta} + X\hat{\beta}-X\beta) \\
     & = (y - X\hat{\beta})^T (y - X\hat{\beta})\ \}  \ \ \textbf{I}\\
     & + (\hat{\beta} - \beta)^TX^TX(\hat{\beta}-\beta)\ \}  \ \ \textbf{II}\\
     & + (y - X\hat{\beta})^T (X\hat{\beta} - X\beta)\ \}  \ \ \textbf{III}\\
     & + (X\hat{\beta} - X\beta)^T(y-X\beta)\ \}  \ \ \textbf{IV}\\
    \end{split}
  \end{equation*}
$$

Therefore:
$$
  \begin{align*}
    Q(\beta) &= \textbf{I + II + III +IV} \\
    &= Q(\hat{\beta}) + (\hat{\beta} - \beta)^TX^TX(\hat{\beta} - \beta) + 0 + 0  \\
  \end{align*}
$$
$$
  \begin{equation*}
    \left\{
      \begin{aligned}
        = Q(\hat{\beta}) \text{ if } \beta = \hat{\beta} \\
        \leq Q(\hat{\beta}) \text{ if } \beta \neq \hat{\beta}
      \end{aligned}
    \right.
  \end{equation*}
$$

$\hat{y} = X\beta$ is an estimator:
$$
\hat{y} = X\hat{\beta} =  X(X^TX)^{-1}X^Ty = Hy
$$
where $H = X(X^TX)^{-1}X$ is called **Hat Matrix**.
