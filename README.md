# Sparse Group Lasso

I created a report and presentation on the Sparse Group Lasso [1] method developed by Noah Simon, Jerome Friedman, Trevor Hastie, and Robert Tibshirani. I used R to reproduce the results in the paper and demonstrate the efficacy of the methodology using Monte Carlo simulations.

## My Abstract
Modern statistical learning commonly deals with problems in high dimensional setting, specifically when p >> n. In such settings, not all the parameters present in a model are equally informative. Additionally, selecting a subset of informative parameters reduces the computational time, while increasing the model’s interpretability. Variable selection through shrinkage methods is a popular approach for this. However, for high dimensional supervised learning problems, often using problem specific assumptions leads to a greater accuracy [1]. Previously proposed models are unable to exploit such assumptions directly. Particularly, for problems with grouped covariates, which are believed to have sparsity at both the group and within group level, no prior methods yield sparsity at both levels. While, the Group Lasso proposed the use of an l2 regularized penalty, and is able to generate sparse solutions at the group level, it is unable to do so at the within-group level [2]. To solve this, Friedman et al [1] proposed a regularized model for linear regression with l1 and l2 penalties. They demonstrated that the optimal fit for this model yields the desired effect of group-wise and within group sparsity. Additionally, Friedman et all [1] proposed an algorithm to fit the model via accelerated generalized gradient descent. In this paper, I summarize the Sparse-Group Lasso method, analyse the proposed algorithm, and demonstrate the efficacy of the methodology on simulated data.
*Keywords: variable selection, regularize, regression, monte carlo, simulation, nesterov, lasso*


## References
[1] Noah Simon, Jerome Friedman, Trevor Hastie, and Robert Tibshirani. A sparse-group lasso. Journal of Computational and Graphical Statistics, 22(2):231–245, 2013.  
[2] Ming Yuan and Yi Lin. Model selection and estimation in regression with grouped variables. Journal of the Royal Statistical Society Series B, 68(1):49–67, 2006.
