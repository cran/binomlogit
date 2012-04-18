\name{dRUMHAM}
\alias{dRUMHAM}
\title{Hybrid auxiliary mixture sampling for the binomial logit model
}
\description{\code{dRUMHAM} simulates the posterior distribution of the regression coefficients of a binomial logit model and returns the MCMC draws. The sampling procedure is based on an algorithm using data augmentation, where the regression coefficients are estimated by rewriting the binomial logit model as a latent variable model called difference random utility model (dRUM). For binomial observations where the success rate \code{yi/Ni} is neither close to 0 nor close to 1 we use the normal distribution as for the \code{\link{dRUMIndMH}} sampler to approximate the Type III generalized logistic distributed error in the dRUM representation. For extreme ratios \code{yi/Ni <= low} and \code{yi/Ni >= up} the error is approximated by the precise scale mixture of normal distributions as used for the \code{\link{dRUMAuxMix}} sampler. The resulting posterior of this regression model is then used as proposal density for the regression coefficients. 
}
\usage{
dRUMHAM(yi, Ni, X, sim = 12000, burn = 2000, b0, B0, start,
       low = 0.05, up = 0.95, verbose = 500)
}
\arguments{
  \item{yi}{an integer vector of counts for binomial data.
}
  \item{Ni}{an integer vector containing the number of trials for binomial data.
}
  \item{X}{a design matrix of predictors.
}
  \item{sim}{number of MCMC draws including burn-in. The default value is 12000 draws.
}
  \item{burn}{number of MCMC draws discarded as burn-in. Default is a burn-in of 2000 draws.
}
  \item{b0}{an optional vector of length \code{dims = ncol(X)} containing the prior mean. Otherwise a vector of zeros is used.
}
  \item{B0}{an optional \code{dims x dims} prior variance-covariance matrix. Otherwise a diagonal matrix with all diagonal elements equal to 10 is used.
}
  \item{start}{an optional vector of length \code{dims = ncol(X)} containing the starting values for the regression parameters. Otherwise a vector of zeros is used.
}
  \item{low}{a numeric value between 0 and 1 indicating that for all observations where the ratio \code{yi/Ni <= low} the precise mixture approximation is used instead of the simpler normal approximation. The default value is 0.05.
}
  \item{up}{a numeric value between 0 and 1 indicating that for all observations where the ratio \code{yi/Ni >= up} the precise mixture approximation is used instead of the simpler normal approximation. The default value is 0.95.
}
  \item{verbose}{an optional non-negative integer indicating that in each \code{verbose}-th iteration step a status report is printed (default: \code{verbose = 500}). If 0, no output is generated during MCMC sampling.
}
}
\details{For details concerning the algorithm see the paper by Fussl, Fruehwirth-Schnatter and Fruehwirth (2012).
}
\value{
The output is a list object of class \code{c("binomlogitHAM","binomlogit")} containing
\item{beta}{a \code{dims x sim} matrix of sampled regression coefficients from the posterior distribution}
\item{sim}{the argument \code{sim}}
\item{burn}{the argument \code{burn}}
\item{dims}{number of covariates (\code{dims = ncol(X)})}
\item{t}{number of binomial observations/covariate patterns (\code{t = length(yi)}); covariate patterns where \code{Ni = 0} are not included}
\item{b0}{the argument \code{b0}}
\item{B0}{the argument \code{B0}}
\item{low}{the argument \code{low}}
\item{up}{the argument \code{up}}
\item{duration}{a numeric value indicating the total time (in secs) used for the function call}
\item{duration_wBI}{a numeric value indicating the time (in secs) used for the \code{sim-burn} MCMC draws after burn-in}
\item{rate}{acceptance rate based on the \code{sim-burn} MCMC draws after burn-in}

To display the output use \code{print}, \code{summary} and \code{plot}. The \code{print} method prints the number of observations and covariates entered in the routine, the total number of MCMC draws (including burn-in), the number of draws discarded as burn-in, the runtime used for the whole algorithm and for the \code{sim-burn} MCMC draws after burn-in and the acceptance rate. The \code{summary} method additionally returns the boundaries \code{low} and \code{up} used for HAM sampling, the prior parameters \code{b0} and \code{B0} and the posterior mean for the regression coefficients without burn-in. The \code{plot} method plots the MCMC draws and their acf for each regression coefficient, both without burn-in.
}
\references{
Agnes Fussl, Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2012), 
"Efficient MCMC for Binomial Logit Models". \emph{currently under revision}.
}
\author{Agnes Fussl <agnes.fussl@jku.at>
}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{dRUMAuxMix}}, \code{\link{IndivdRUMIndMH}}
}
\examples{
## Hybrid auxiliary mixture sampling in the aggregated dRUM representation of a 
## binomial logit model

## load caesarean birth data
data(caesarean)
yi <- as.numeric(caesarean[,1])                          
Ni <- as.numeric(caesarean[,2])                           
X <- as.matrix(caesarean[,-(1:2)])

## start HAM sampler
ham1 <- dRUMHAM(yi,Ni,X)
ham2 <- dRUMHAM(yi,Ni,X,low=0.01,up=0.99)

print(ham1)
summary(ham1)
plot(ham1)
}
\keyword{regression}
