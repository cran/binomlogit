\name{caesarean}
\alias{caesarean}
\alias{caesarean_aux}
\alias{caesarean_binary}
\docType{data}
\title{
  Caesarean Birth Data
}
\description{
The data set contains information on infection from births by Caesarean section, originating from a 3-way contingency table. 251 mothers were categorized by the variables "Caesarean planned" (yes/no), "antibiotics given" (yes/no) and "risk factors present" (yes/no). To obtain data for a binary regression model the originally observed two types of infection are ignored and just the binary event "infection" or "no infection" is considered. For the binomial logit regression model all binary observations with the same covariate pattern are aggregated to a binomial observation.
}
\usage{data(caesarean)

data(caesarean_aux)

data(caesarean_binary)}
\format{
  The binomial data set \code{caesarean} consists of 8 binomial observations (= aggregated binary observations) and the following 6 variables:
  \describe{
    \item{\code{yi}}{number of women with infection}
    \item{\code{Ni}}{number of observed women in each group}
    \item{\code{intercept}}{column consisting of ones}
    \item{\code{planned}}{Caesarean birth planned (1 = yes, 0 = no)}
    \item{\code{riskfactors}}{risk factors present (1 = yes, 0 = no)}
    \item{\code{antibiotics}}{antibiotics given (1 = yes, 0 = no)}
  }



  The binary data set \code{caesarean_binary} consists of 251 binary observations and the following 5 variables:
  \describe{
    \item{\code{y}}{infection (1 = yes, 0 = no)}
    \item{\code{planned}}{Caesarean birth planned (1 = yes, 0 = no)}
    \item{\code{riskfactors}}{risk factors present (1 = yes, 0 = no)}
    \item{\code{antibiotics}}{antibiotics given (1 = yes, 0 = no)}
    \item{\code{intercept}}{column consisting of ones}
  }



  To run auxiliary mixture sampling in the individual dRUM representation of the binomial logit model the binary data set should have the same form as the binomial data set. For this purpose a column consisting of ones is added to the binary data set. The data set \code{caesarean_aux} then consists of 251 observations and the following 6 variables:
  \describe{
    \item{\code{yi}}{number of women with infection}
    \item{\code{Ni}}{number of observed women in each group, which is equal to 1 for all observations}
    \item{\code{planned}}{Caesarean birth planned (1 = yes, 0 = no)}
    \item{\code{riskfactors}}{risk factors present (1 = yes, 0 = no)}
    \item{\code{antibiotics}}{antibiotics given (1 = yes, 0 = no)}
    \item{\code{intercept}}{column consisting of ones}
  }
}
\source{
Fahrmeir, L. and Tutz, G. (2001) \emph{Multivariate Statistical Modelling based on Generalized Linear Models}, 2nd Ed. Springer Series in Statistics. Springer, New York/Berlin/Heidelberg.
}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{dRUMAuxMix}}, \code{\link{dRUMHAM}}, \code{\link{IndivdRUMIndMH}}
}
\examples{
  data(caesarean)
  data(caesarean_binary)
  data(caesarean_aux)
  ## see dRUMIndMH, dRUMAuxMix, dRUMHAM and IndivdRUMIndMH documentation for examples
  ## using these data
}
\keyword{datasets}
