\name{dRUMAuxMix}
\alias{dRUMAuxMix}
\title{Auxiliary mixture sampling for the binomial logit model
}
\description{\code{dRUMAuxMix} simulates the posterior distribution of the regression coefficients of a binomial logit model and returns the MCMC draws. The sampling procedure is based on an algorithm using data augmentation, where the regression coefficients are estimated by rewriting the binomial logit model as a latent variable model called difference random utility model (dRUM). The Type III generalized logistic distribution of the error in this dRUM representation is approximated by a scale mixture of normal distributions.
}
\usage{
dRUMAuxMix(yi, Ni, X, sim = 12000, burn = 2000, b0, B0, start, verbose = 500)
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
  \item{verbose}{an optional non-negative integer indicating that in each \code{verbose}-th iteration step a status report is printed (default: \code{verbose = 500}). If 0, no output is generated during MCMC sampling.
}
}
\details{
For details concerning the algorithm see the paper by Fussl, Fruehwirth-Schnatter and Fruehwirth (2013).
}
\value{
The output is a list object of class "binomlogit" containing
\item{beta}{a \code{dims x sim} matrix of sampled regression coefficients from the posterior distribution}
\item{sim}{the argument \code{sim}}
\item{burn}{the argument \code{burn}}
\item{dims}{number of covariates (\code{dims = ncol(X)})}
\item{t}{number of binomial observations/covariate patterns (\code{t = length(yi)}); covariate patterns where \code{Ni = 0} are not included}
\item{b0}{the argument \code{b0}}
\item{B0}{the argument \code{B0}}
\item{duration}{a numeric value indicating the total time (in secs) used for the function call}
\item{duration_wBI}{a numeric value indicating the time (in secs) used for the \code{sim-burn} MCMC draws after burn-in}

To display the output use \code{print}, \code{summary} and \code{plot}. The \code{print} method prints the number of observations and covariates entered in the routine, the total number of MCMC draws (including burn-in), the number of draws discarded as burn-in and the runtime used for the whole algorithm and for the \code{sim-burn} MCMC draws after burn-in. The \code{summary} method additionally returns the used prior parameters \code{b0} and \code{B0} and the posterior mean for the regression coefficients without burn-in. The \code{plot} method plots the MCMC draws and their acf for each regression coefficient, both without burn-in.
}
\references{
Agnes Fussl, Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2013), 
"Efficient MCMC for Binomial Logit Models". \emph{ACM Transactions on Modeling and Computer Simulation 23}, 1, Article 3, 21 pages.
}
\author{Agnes Fussl <agnes.fussl@jku.at>
}
\note{
\code{dRUMAuxMix} can also be used to estimate the regression coefficients in the individual dRUM representation of the binomial logit model, i.e. using binary observations as input. For this purpose, add a column in the data set next to the binary response variable, containing the repetition parameter \code{Ni = 1} for each binary observation.
}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{dRUMHAM}}, \code{\link{IndivdRUMIndMH}}
}
\examples{
## Auxiliary mixture sampling in the aggregated dRUM representation of a
## binomial logit model

## load caesarean birth data
data(caesarean)
yi <- as.numeric(caesarean[,1])                          
Ni <- as.numeric(caesarean[,2])                           
X <- as.matrix(caesarean[,-(1:2)])

## start auxiliary mixture sampler
aux1=dRUMAuxMix(yi,Ni,X,verbose=0)
\dontrun{
aux2=dRUMAuxMix(yi,Ni,X)
}

print(aux1)
summary(aux1)
plot(aux1)

\dontrun{
## Auxiliary mixture sampling in the individual dRUM representation of a
## binomial logit model

## load caesarean birth data
data(caesarean_aux)
yi <- as.numeric(caesarean_aux[,1])                          
Ni <- as.numeric(caesarean_aux[,2])                           
X <- as.matrix(caesarean_aux[,-(1:2)])

## start auxiliary mixture sampler
aux3=dRUMAuxMix(yi,Ni,X)

print(aux3)
summary(aux3)
plot(aux3)
}
}
\keyword{regression}
