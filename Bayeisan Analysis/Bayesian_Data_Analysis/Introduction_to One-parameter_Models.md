# Introduction to One-Parameter Models

## First stage of Bayesian Models

1. Bernoulli $\Rightarrow$ binary also identical independent Bernoulli distribution
a  random variable $Y \Rightarrow $the number of success:

$Y \sim \text{ Binomial } (n, \theta)$

$f(y,n, \theta) \Rightarrow \binom{n}{y} \theta^y ( 1 - \theta)^{n-y}, \ \ \binom{n}{y} = C^y_n = \frac{n!}{y!(n-y!)}$

**Kernel** of a distribution: **all terms** that will change in value for different values of the variable of interest.

**Normalizing Constant**: it is a constants by which an every where non-negative function must be multiplied so they are under graph is 1.

## Likelihood Function

 **likelihood function**: when we got  a exact random variable $Y = \alpha$, we may change persective and regard the expression in as the function of the unknown parameter $\pi \text{ or } \theta$ given the now known ( fixed ) data value $\alpha$

 e.g. if $\alpha = 7 \Rightarrow L(Y=7, \pi) = \binom{50}{7} \pi^7 (1 - \pi)^{43}$
$\binom{50}{7}$ is a **Normalizing constants** and $\pi^7 (1 - \pi)^{43}$ is the kernel of the distribution.
Since the kernel will not affact the $p(\pi)$, so we can write the likelihood function:

$\begin{align*}
  L(\pi;y) &\propto \pi^7 (1 - \pi)^{43}, \ 0 < \pi < 1 \\
  \text{ generically} &\Rightarrow \pi^y (1 - \pi)^{n - y}, \ 0 < \pi < 1
\end{align*}$

 ## Second Stage: **the Prior**

**Prior Distribution:**
  1. noninformative (most)
  2. informative (if there are some experts)

**Prior Probability Interval**

## Using the Data to update the Prior: **Posterior distribution**

**Posterior Distribution**: the posterior probability distribution is the probability distribution of an unknown quantity, treated as a random variable, conditional on the evidence obtained from an experiment or survey.

$\overbrace{P(\pi|y)}^{\text{posterior distribution}} \propto
\underbrace{p(\pi)}_{\text{prior distribution}} \times \underbrace{L(\pi;y)}_{\text{likelihood function}}$

## Conjugate prior

It is a common way to construct a prior distribution

$\Rightarrow$ desingate that the prior is a member of a particular family of densties.

$\Rightarrow$ parameter of the prior density to reflect the data as dose as possible

**$☆\underline{\text{same functional form as the likelihood function}}$**

E.g:

In beta family:
  1. interval  = $(0,1)$
  2. the random variable and one minus the random variable each appear raised to a nonegative power.

## Computing the Posterior Distribution with Conjugate Prior

The relationship of posterior $\sim$ the prior and likelihood function: $p(\pi | y) \propto p(\pi) L(\pi;y)$

If we choose Beta distribution to be the prior distribution [ $p(\pi)$]

$\begin{align*}
\Rightarrow p(\pi | y ) &\propto \pi^{\alpha - 1}(1 - \pi)^{\beta - 1} \pi^y (1 - \pi)^{n-y} \\
&= \pi^{\alpha + y - 1} (1 - \pi)^{n + \beta -y - 1} \\
\end{align*}$

and the posterior distribution is the kernel of another Beta distribution $\Rightarrow \text{Beta} ( \alpha + y , \beta + n - y)$

$\begin{align*}
  \alpha_2 &= \alpha + y -1 \\
  \beta_2 &= n + \beta - y -1 \\
  \Rightarrow B(\alpha_2 - 1, \beta) &= B(\alpha + y, n + \beta + y)
\end{align*}$

<font color="red"> The resulting posterior density will be in the same family as the prior. This is the implication of conjugacy </font>

When we combine our previous knowledge with the additional information in the current data, our knowledge becomes more precise than when we consider either one of the two sources alone.

## Inference for Population Proportion

Statistical inference $\Rightarrow$ drawing conclusion about an entire population based on data in a sample drawn.

**main goal** of the Inference
1. estimization
2. hypothesis testing
3. prediction
