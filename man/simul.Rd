\name{simul}
\alias{simul}
\alias{simul_binary}
\docType{data}
\title{
  Simulated data set
}
\description{
For testing purposes we constructed the very extreme and unbalanced simulated binomial data set \code{simul}. The pattern of this data set is typical of models for rare events, e.g. rare diseases or financial defaults. Based on a fixed number of \code{dims = 10} covariates consisting of nine binary variables and the intercept, the design matrix \code{X} is built by computing all 2^9 possible 0/1 combinations. As true parameter vector we defined \code{beta={0.05,2,1.5,-3,-0.01,-1.3,2.9,-2.1,0.5,-0.2}}. For details concerning the simulation of the data set see the paper by Fussl, Fruehwirth-Schnatter and Fruehwirth (2013). To use the data set with the function \code{\link{IndivdRUMIndMH}}, binary outcomes are reconstructed from the binomial observations and saved as \code{simul_binary}.
}
\usage{data(simul)

data(simul_binary)}
\format{
  The binomial data set \code{simul} consists of 512 binomial observations and the following 12 variables:
  \describe{
    \item{\code{yi}}{number of successes for each covariate pattern}
    \item{\code{Ni}}{group size for each covariate pattern}
    \item{\code{X,X.1,...,X.8}}{binary covariates}
    \item{\code{X.9}}{intercept}
  }
  Only 490 covariate patterns have a group size \code{Ni > 0} and will be included when using the functions \code{\link{dRUMIndMH}}, \code{\link{dRUMAuxMix}} and \code{\link{dRUMHAM}}.



  The binary data set \code{simul_binary} consists of 25803 binary observations and the following 11 variables:
  \describe{
    \item{\code{y}}{binary response variable}
    \item{\code{X,X.1,...,X.8}}{binary covariates}
    \item{\code{X.9}}{intercept}
  }
}
\source{
Agnes Fussl, Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2013), 
"Efficient MCMC for Binomial Logit Models". \emph{ACM Transactions on Modeling and Computer Simulation 23}, 1, Article 3, 21 pages.
}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{IndivdRUMIndMH}}
}
\examples{
  data(simul)
  data(simul_binary)
  ## see dRUMIndMH and IndivdRUMIndMH documentation for examples using these data
}
\keyword{datasets}
