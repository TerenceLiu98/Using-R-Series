## Part One Fundamentals of Bayesian Inference

### The three steps of Bayesian data analysis

The process of Bayesian data analysis can be idealized by dividing it to the following three steps:
1. Setting up a *full probability model* -- a joint probability distribution for all observable and unobservable quantities in a problem and the data collection process.
2. Coditioning on observed data: calculating and interpreting (解释，诠释) the appropriate *posterior distribution* -- the conditional probability distribution of the unobserved quantities of ultimate interest, given the observed data.
3. Evaluating the fit of the model and the implications of the resulting posterior distribution: how well does the model fit the data, are the substantive (独立的，真实的) conclustion reasonable, and how sensitive are the results to the modeling assumptions in step 1? In response, on ca alter or expand the model and repeat the three steps.

### Bayesian inference (贝叶斯推断)

Bayesian statistical conclusions about a parameter $\theta$, or unobserved data $\tilde{y}$ are make in terms of  *probability* statements. These probability statements are conditional on the observed valyes of $y$, and in $\dots \dots$

#### Bayes' Rule

In order to make probability statements about $\theta$ given $y$, we must begin with a *model* providing a *joint probability distribution* of $\theta$ and $y$. The joint probability mass or density function can be written as a product of two densities that are often referred to as the *prior distribution* $p(\theta)$ and the *sampling distribution* $p(y|\theta)$, respectively: $p(\theta, y) = p(\theta)p(y|\theta)$

Then we can write the *posterior density*:

$$
    p(\theta|y) = \frac{p(\theta,y)}{p(y)} = \frac{p(\theta)p(y|\theta)}{p(y)} \tag{1.1}
$$

where $p(y) = \sum_{\theta} p(\theta)p(y|\theta)$, and the sum is over all possible values of $\theta$. (or $p(y) = \int_{\theta}p(\theta)p(y|\theta) d\theta$ for the continuous $\theta$) An equivalent form of $(1.1)$ omits (省略，删去) the factor $p(y)$, which does not depend on $\theta$ and, with fixed $y$, can thus be considered a constant, yilding the *unnormalized posterier density*,which is the right side of (1.2):

$$
    p(\theta|y) \propto p(\theta)p(y|\theta)
$$


The second term in this expression, $p(y|\theta)$ is taken here as a function of $\theta$, not of $y$ (**since $p(y|\theta)$ is the likelihood function**). These simple formulas encapsulate the technical core of Bayesian inference: the primary task of any specific application is to develop the model $p(\theta,y)$ and perform the computations to summarize $p(\theta|y)$ in appropriate ways.



#### Prediction

To make inferences about an unknown observable, ofen called predictive inferences, we follow a similar logic. Before the data $y$ are considered, the distribution of the unknown but observable $y$ is:

$$
    p(y) = \int p(y,\theta)d\theta = \int p(\theta)p(y|\theta)d\theta \tag{1.3}
$$

This is ofen called the marginal distribution of $y$, but a more informative name is the *prior predictive distribution*: prior because it is not conditional on a previous observation of the process, and predictive because it is the distribution for a quantity that is observable.

After the data $y$ have been observed, we can predict an unknown observable,$\tilde{y}$, from the same process. For example, $y = (y_1, y_2, \dots, y_n)$ may be the vector of recorded weights of an object weighed $n$ times on a scale, $\theta = (\mu,\sigma^2)$ may be the unknown true weight of the object and the measurement variance of the scale, and $\tilde{y}$ may be the yet to be recorded weight of the object in a planned new weighing. The distribution of $\tilde{y}$ is called the posterior predictive distribution for an observable $\tilde{y}$:

$$
    \begin{align*}
        p(\tilde{y}|y) &= \int p(\tilde{y},\theta|y)d\theta \\
                       &= \int p(\tilde{y}|\theta,y)p(\theta|y)d\theta \\
                       &= \int p(\tilde{y}|\theta)p(\theta|y)dd\theta  \tag{1.4}
    \end{align*}
$$

The second and the thrid lines display the posterior predictive distribution as an averge of conditional predictions over the posterior distribution of $\theta$. The last step follows from the assumed conditional indemendence of $y$ and $\tilde{y}$ given $\theta$.






#### Likelihood

Using Baye's rule with a chosen probability model means that the data $y$ affect the posterior inference $(1.2)$ only through $p(y|\theta)$, which, when regarded as a function of $\theta$, for fixed $y$ is called the *likelihood function*. In this way Bayesian inference obesys what is sometimes called the *likelihood principle*, which state. that for a given sample of data, any two probability models $p(y|\theta)$ that have the msame likelihhod function yield (屈服，服从)the same inference for $\theta$

#### Likelihoood and odds ratios

The ratio of the posterior density $p(\theta|y)$ evaluated at the  points $\theta_1$ and $\theta_2$ under a given model is called the posterior odds for $\theta_1$ compared to $\theta_2$. The most familiar application of this concept is with disccrete parameters, with $\theta_2$ taken to be the complement of $\theta_1$. Odds provide an alternative representation of probabilities and have the attractive property that Bayes's rule takes a praticularly simple form when expressed in terms of them:

$$
    \frac{p(\theta_1|y)}{p(\theta_2|y)} = \frac{p(\theta_1)p(y|\theta_1)}{p(\theta_2)p(y|\theta_2)}
$$

#### Modeling using conditional probability

##### Means and variances of conditional distribution
It is often useful to express the mean and variance of a random varialbe $u$ in terms of the conditional mean and vairance given some related quantity $v$. The mean of $u$ can be obtianed by averaging the conditional mean over the marginal distribution of $v$:

$$
    E(u) = E(E(v|v)) = \int E(u|v)p(v)dv
$$


The corresponding result for the variance includes two terms, the mean of the conditional variance and the variance of the conditional mean:

$$
    var(u) = E(var(u|v)) + var(E(u|v))
$$

The result can be derived by expanding the terms on the right sides:

<center>
$\begin{align*}
    E(var(u|v)) + var(E(u|v)) &= E(E(u^2|v) - E(u|v))^2 + E((E(u|v))^2) - (E(E(u|v)))^2 \\
                              &= E(u^2) - E((E(u|v))^2) + E((E(u|v))^2) - (E(u))^2 \\
                              &= E(u^2) - (E(u))^2 \\
                              &= var(u)
\end{align*}$
</center>


We can know that $E(u)$ is a vector and $var(u)$ is a matrix.



### Single-parameter models

our first detailed discussion of Bayesian inference is in the context of statistical models where only a single scalar parameter is to be estimated; that is , the estimand (被估计) $\theta$ is one-dimensinal. Inthis chapter, we consider four fundamental and widely used one-dimensional models -- **the binomial**,**normal**,**Poisson** and **expnential** -- and at the same time introduce important concepts and computational methos for Bayesian data analysis.

#### Estimating a probabillity from binomial data

In the simple binomial model, the aim is to estimate an unknown population proportion from the results of a sequence of *Bernoulli trials*, that is : data $y_1, y_2, \dots,y_n$, each of which is either $0$ or $1$. This problem provides a relatively simple but important starting point for the discussion of Bayesian inference.

The binomial distribution provides a natural model for data taht arise from a sequence of $n$ exchangeable trails or draws from a large population where each trial gives rise to  one of two possible outcomes, conventionally labeled 'success' and 'failure'. Because of the exchangeability, the data can be summarized by the total number of successes in the $n$ trails, which we denote here by $y$. Converting from a formulation in terms of exchangealbe trials to one using independent and identically distributed random varialbes is achieved natrually by letting the parameter $\theta$ represent the proportion of successes in the population or, equivalently, the probability of success in each trial. The binomial sampling model is :

$$
    p(y|\theta) = Bin(y|n,\theta) = \left(^n_y\right) \theta^y (1-\theta)^{n-y}
$$

where on the left side we suppress the dependence on $n$ because it is regarded as part of the experimental design that is considered fixed; all the probabilities discussed for this problem are assumed to be conditional on $n$


To perform Bayesian inference in the binomial model, we must specify a prior distribution for $\theta$. We will discuss issues associated with specifying prior distributions many times throughout this book, but for simplicity at this point, we assume that the prior distribution for $\theta$ is uniform on the interval $[0,1]$

Elementary application of Bayes' rule as displayed in before, applied to the binomial distribution , then gives the posterior density for $\theta$ as:

$$
    p(\theta|y) \propto \theta^y (1-\theta^{n-y} \tag{2.1}
$$

With fiexed $n$ and $y$, the factor $\left(^n_y\right)$ does not depend on the unknown parameter $\theta$, and so it can be treated as a constant when calculating the posterior distribution of $\theta$.  As is typical constant of proportionality. In single-parameter problems, this allows immediately in closed form, up to a presentation of the posterior distribution.

We can recognized (2.2) as the unnormalized form of the *beta distribution*

$$
    \theta|y \sim \text{Beta}(y+1, n-y+1)
$$


#### Beta Distribution

In probability theory and statistics, the **beta distribution** is a family of continuous probability distributions defined on the interval [0,1] parametrized by two positive shape parameters, denoted by $\alpha$ and $\beta$, that appear as exponents of the random variable and control the shape of the distribtuion.

In Bayesian inference, the beta distribution is  the **conjugate prior probability distribution**  ( This concept we will mention at the coming chapter) for the Bernoulli, binomial, negative-binomial and geometric distributions.

THe properties of Beta Distribution:

* Notation: $\text{Beta}(\alpha, \beta)$
* Parameters: $\alpha, \beta$
* PDF: $p(x) = \frac{x^{\alpha -1}(1-x)^{\beta - 1)}}{B(\alpha,\beta)}, \text{ where } B(\alpha,\beta) = \frac{\Gamma(\alpha)\Gamma(\beta)}{\Gamma(\alpha + \beta)}$
* mean: $E(x) = \frac{\alpha}{\alpha + \beta}$
* Variance: $Var(x) = \frac{\alpha \beta}{(\alpha + \beta)^2(\alpha + \beta + 1)}$
* Mode: $\frac{\alpha -1 }{\alpha + \beta -2}$

#### Historical noteL Bayes and Laplace

Many early writers on probability dealt with the elementary binomial model. The first contributions of lasting significance, in the 17th and early 18th centuies, concentrated on the 'pre-data' question: **given $\theta$, what are the probabilities of the various possible outcomes of the random variable $y$?** For example, the 'weak law of large numbers' of Jacob Bernoulli states that if $y \sim \text{Bin}(n,\theta)$, then $Pr(|\frac{y}{n} - \theta) \rightarrow 0$ as $n \rightarrow \infty$, for any $theta$ and any fixed value of $\epsilon >0$. The Reverend Thomas Bayes, an English part-time mathematician whose work was unpublished during his lifetime, and Pierre Simon Laplace, an inventive and productive mathematical scientist whose massive output spanned the Napoleonic era in France, receive independent credit as the first to *invert* the probability statement and obtain probability staements about $\theta$, given observed $y$.

In his famous paper, published in 1763, Bayes sought, in our notation, the probablility: $Pr(\theta \in(\theta_1, \theta_2)|y)$;his solution was based on a physical analogy (类比) of a probability space to a rectangular table such as a billiard table).

1. **(Prior Distribution)** A ball $W$ is randomly thrown (according to a uniform distribution on the table). The horizontal position of the ball on the table is $\theta$, expressed as a fraction of the table width.
