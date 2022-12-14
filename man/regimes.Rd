% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regimes.R
\name{regimes}
\alias{regimes}
\alias{coef.regimes}
\alias{vcov.regimes}
\alias{print.regimes}
\alias{summary.regimes}
\alias{print.summary.regimes}
\title{Estimation of spatial regimes models}
\usage{
regimes(formula, data, rgv = NULL, vc = c("homoskedastic", "groupwise"))

\method{coef}{regimes}(object, ...)

\method{vcov}{regimes}(object, ...)

\method{print}{regimes}(x, digits = max(3, getOption("digits") - 3), ...)

\method{summary}{regimes}(object, ...)

\method{print}{summary.regimes}(x, digits = max(5, getOption("digits") - 3), ...)
}
\arguments{
\item{formula}{a symbolic description of the model of the form \code{y ~ x_f | x_v} where \code{y} is the dependent variable, \code{x_f} are the regressors that do not vary by regimes and  \code{x_v} are the regressors that vary by regimes}

\item{data}{the data of class \code{data.frame}.}

\item{rgv}{an object of class \code{formula} to identify the regime variables}

\item{vc}{one of \code{c("homoskedastic", "groupwise")}. If \code{groupwise}, the model VC matrix is estimated by weighted least square.}

\item{object}{an object of class regime}

\item{...}{additional arguments}

\item{x}{an object of class regimes}

\item{digits}{number of digits}
}
\value{
An object of class \code{lm} and \code{regimes}. If \code{vc = "groupwise"} the model is estimated in two steps and the second steps uses weighted least squares.
}
\description{
Estimation of spatial regimes models
}
\details{
The model estimated is:

\deqn{
y_{ij}= \mathbf{x_{ij,k}}\beta_j + \epsilon
}
for i=1,..,n representing the sample observations, and j =1,..., J representing
the number of regimes
}
\examples{
data("baltim")
form   <- PRICE  ~ NROOM + NBATH + PATIO + FIREPL + AC + GAR + AGE + LOTSZ + SQFT
split  <- ~ CITCOU
mod <- regimes(formula = form, data = baltim, rgv = split, vc = "groupwise")
summary(mod)
form <- PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT | NBATH + GAR + LOTSZ - 1
mod <- regimes(form, baltim, split, vc = "homoskedastic")
summary(mod)


}
\author{
Gianfranco Piras and Mauricio Sarrias
}
