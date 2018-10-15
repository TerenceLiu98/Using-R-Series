# Probability and inference

## The three steps of Bayesian analysis

**The process of Bayesian data analysis** can be idealized by dividing it into the following three
steps:
  * Setting up a full probability model
  * Conditional on observed data
  * Evaluating the fit of the model and the implications of the resulting posterior distribution
### full probability model
The joint probabiltiy distribuiton for all observalbe and unobservable quantities in a problem. According to the full probability model:$P(B)$ can be written into $\displaystyle \sum_{i=1}^n P(B\vert A_n)\times P(A_n)$. Also, there is a concept called **conditional probability**: $P(B\vert A) = \frac{P(A,B)}{P(B)}$. Combine these two equation, we can get the bayes' rules: $P(A\vert B) = \frac{P(B\vert A)\times P(A)}{\sum_{i=1}^n P(B\vert A_n)\times P(A_n)}$

### Conditioning on observed data:
This can calculating and interpreting the appropriate *posterior distribution* 
