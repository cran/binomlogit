\name{binomlogit-package}
\alias{binomlogit-package}
\alias{binomlogit}
\docType{package}
\title{
Efficient MCMC for Binomial Logit Models
}
\description{
The R package contains different MCMC schemes to estimate the regression coefficients of a binomial (or binary) logit model within a Bayesian framework: a data-augmented independence MH-sampler, an auxiliary mixture sampler and a hybrid auxiliary mixture (HAM) sampler. All sampling procedures are based on algorithms using data augmentation, where the regression coefficients are estimated by rewriting the logit model as a latent variable model called difference random utility model (dRUM).
}
\details{
\tabular{ll}{
Package: \tab binomlogit\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2013-08-13\cr
License: \tab GPL-3\cr
}
The main functions are \code{\link{dRUMIndMH}} for independence Metropolis-Hastings sampling, \code{\link{dRUMAuxMix}} for auxiliary mixture sampling and \code{\link{dRUMHAM}} for hybrid auxiliary mixture sampling in the dRUM representation of a binomial logit model. The function \code{\link{IndivdRUMIndMH}} is designed to work with binary instead of binomial observations to estimate the regression coefficients of a logit model. All four functions simulate the posterior distribution of the regression coefficients of the logit model and return the MCMC draws. For more details about the models and the estimation procedures see \bold{References}. The results are returned in a list of class "binomlogit"" and can be displayed by using the functions \code{print} and \code{summary}. The \code{plot} method returns a plot of the MCMC draws and the acf.
The Caesarean birth data set (\code{\link{caesarean}}) is provided in three different formats to serve as exemplary input for the different MCMC schemes.
}
\author{
Agnes Fussl

Maintainer: Agnes Fussl <agnes.fussl@jku.at>
}
\references{
Agnes Fussl, Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2013), 
"Efficient MCMC for Binomial Logit Models". \emph{ACM Transactions on Modeling and Computer Simulation 23}, 1, Article 3, 21 pages.

Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2010),
"Data augmentation and MCMC for binary and multinomial logit models."
In \emph{Statistical Modelling and Regression Structures - Festschrift in Honour
of Ludwig Fahrmeir}, T. Kneib and G. Tutz, Eds. Physica-Verlag, Heidelberg, pp. 111-132.
}
\keyword{package}
\keyword{regression}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{dRUMAuxMix}}, \code{\link{dRUMHAM}}, \code{\link{IndivdRUMIndMH}}

To evaluate the efficiency of the different MCMC samplers as in the paper by Fussl, Fruehwirth-Schnatter and Fruehwirth (2013), use e.g. the initial sequence estimator \code{\link[mcmc]{initseq}} by Geyer (package \pkg{mcmc}), the \code{\link[bayesm]{numEff}} function by Rossi (package \pkg{bayesm}) or the appropriate functions of the \pkg{coda} package by Plummer, Best, Cowles and Vines.
}

\examples{
# please run the examples in dRUMIndMH, dRUMAuxMix, dRUMHAM and IndivdRUMIndMH
}
