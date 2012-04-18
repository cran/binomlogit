\name{IndivdRUMIndMH}
\alias{IndivdRUMIndMH}
\title{Data-augmented independence Metropolis-Hastings sampling for the binary logit model
}
\description{\code{IndivdRUMIndMH} simulates the posterior distribution of the regression coefficients of a binary logit model and returns the MCMC draws. The sampling procedure is based on an algorithm using data augmentation, where the regression coefficients are estimated by rewriting the binary logit model as a latent variable model called difference random utility model (dRUM). This dRUM representation of the binary logit model is equivalent to the individual dRUM representation of the binomial logit model. The logistic distribution of the error in the dRUM representation is approximated by a normal distribution with same mean and variance. The posterior of this approximate regression model is then used as independence proposal density for the regression coefficients.
}
\usage{
IndivdRUMIndMH(y, X, sim = 12000, burn = 2000, acc = 0, b0, B0, start,
               verbose = 500)
}
\arguments{
  \item{y}{logical or coercible to integer with values 0 and 1 (Bernoulli data).
}
  \item{X}{a design matrix of predictors.
}
  \item{sim}{number of MCMC draws including burn-in. The default value is 12000 draws.
}
  \item{burn}{number of MCMC draws discarded as burn-in. Default is a burn-in of 2000 draws.
}
  \item{acc}{number of MCMC draws at the beginning of the burn-in phase where each proposed parameter vector is accepted with probability 1 rather than according to the MH acceptance rule. Choose a small number \code{acc > 0} if the sampler gets stuck at the starting values, otherwise \code{acc} is set to 0.
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
\details{For details concerning the algorithm see the papers by Fussl, Fruehwirth-Schnatter and Fruehwirth (2012) and Fruehwirth-Schnatter and Fruehwirth (2010).
}
\value{
The output is a list object of class \code{c("binomlogitIndiv","binomlogitMH","binomlogit")} containing
\item{beta}{a \code{dims x sim} matrix of sampled regression coefficients from the posterior distribution}
\item{sim}{the argument \code{sim}}
\item{burn}{the argument \code{burn}}
\item{acc}{the argument \code{acc}}
\item{dims}{number of covariates (\code{dims = ncol(X)})}
\item{N}{number of binary observations}
\item{b0}{the argument \code{b0}}
\item{B0}{the argument \code{B0}}
\item{duration}{a numeric value indicating the total time (in secs) used for the function call}
\item{duration_wBI}{a numeric value indicating the time (in secs) used for the \code{sim-burn} MCMC draws after burn-in}
\item{rate}{acceptance rate based on the \code{sim-burn} MCMC draws after burn-in}

To display the output use \code{print}, \code{summary} and \code{plot}. The \code{print} method prints the number of observations and covariates entered in the routine, the total number of MCMC draws (including burn-in), the number of draws discarded as burn-in, the runtime used for the whole algorithm and for the \code{sim-burn} MCMC draws after burn-in and the acceptance rate. The \code{summary} method additionally returns the length of the acceptance phase during burn-in, the used prior parameters \code{b0} and \code{B0} and the posterior mean for the regression coefficients without burn-in. The \code{plot} method plots the MCMC draws and their acf for each regression coefficient, both without burn-in.
}
\references{
Agnes Fussl, Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2012), 
"Efficient MCMC for Binomial Logit Models". \emph{currently under revision}.

Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth (2010),
"Data augmentation and MCMC for binary and multinomial logit models."
In \emph{Statistical Modelling and Regression Structures - Festschrift in Honour
of Ludwig Fahrmeir}, T. Kneib and G. Tutz, Eds. Physica-Verlag, Heidelberg, pp. 111-132.
}
\author{Agnes Fussl <agnes.fussl@jku.at>
}
\note{To perform auxiliary mixture sampling for the binary logit model use \code{\link{dRUMAuxMix}} and follow the instructions given there.
}
\seealso{\code{\link{dRUMIndMH}}, \code{\link{dRUMAuxMix}}, \code{\link{dRUMHAM}}
}
\examples{
## Data-augmented independence Metropolis-Hastings sampling for the binary logit model

## load caesarean birth data
data(caesarean_binary)
y <- as.numeric(caesarean_binary[,1])                                                 
X <- as.matrix(caesarean_binary[,-1])

## start independence MH sampler
indivMH1 <- IndivdRUMIndMH(y,X)

print(indivMH1)
summary(indivMH1)
plot(indivMH1)

\dontrun{
## load simulated data set
data(simul_binary)
y <- as.numeric(simul_binary[,1])                                           
X <- as.matrix(simul_binary[,-1])

## use a small acc>0 (e.g. acc=50), otherwise the sampler gets stuck at the starting
## values
indivMH2 <- IndivdRUMIndMH(y,X,acc=50)

print(indivMH2)
summary(indivMH2)
plot(indivMH2)
}
}
\keyword{regression}
