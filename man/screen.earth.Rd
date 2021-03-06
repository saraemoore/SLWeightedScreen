% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/splines.R
\name{screen.earth}
\alias{screen.earth}
\title{Non-linear regression screening algorithm}
\usage{
screen.earth(
  Y,
  X,
  family,
  obsWeights,
  id,
  selector = c("cutoff.biggest.diff", "cutoff.k", "cutoff.k.percent"),
  k = switch(selector, cutoff.k = ceiling(0.5 * ncol(X)), cutoff.k.percent = 0.5, NULL),
  importanceType = c("nsubsets", "rss", "gcv"),
  degree = 2,
  penalty = 3,
  kForward = max(21, 2 * ncol(X) + 1),
  pMethod = "cv",
  nFold = 5,
  ...
)
}
\arguments{
\item{Y}{Outcome (numeric vector). See \code{\link[SuperLearner]{SuperLearner}}
for specifics.}

\item{X}{Predictor variable(s) (data.frame or matrix). See
\code{\link[SuperLearner]{SuperLearner}} for specifics.}

\item{family}{Error distribution to be used in the model:
\code{\link[stats]{gaussian}} or \code{\link[stats]{binomial}}.
Currently unused. See \code{\link[SuperLearner]{SuperLearner}}
for specifics.}

\item{obsWeights}{Passed on via \code{\link[earth]{earth}}'s \code{weights}
argument. Expect slower computation time if \code{obsWeights} are provided.}

\item{id}{Cluster identification variable. Currently unused.}

\item{selector}{A string corresponding to a subset selecting function
implemented in the FSelector package. One of:
\code{\link[FSelector]{cutoff.biggest.diff}} (default),
\code{\link[FSelector]{cutoff.k}}, or
\code{\link[FSelector]{cutoff.k.percent}}.}

\item{k}{Passed through to the \code{selector} in the case where \code{selector} is
\code{\link[FSelector]{cutoff.k}} or \code{\link[FSelector]{cutoff.k.percent}}.
Otherwise, should remain NULL (the default). For \code{\link[FSelector]{cutoff.k}},
this is an integer indicating the number of features to keep from \code{X}.
For \code{\link[FSelector]{cutoff.k.percent}}, this is instead the proportion
of features to keep.}

\item{importanceType}{Variable importance criterion. One of:
\code{"nsubsets"} ("number of subsets"), \code{"rss"}, or \code{"gcv"}.}

\item{degree}{Maximum degree of interaction. Default: 2. 1 would indicate
no interaction terms should be used.}

\item{penalty}{Generalized Cross Validation (GCV) penalty per knot.
Default: 3.}

\item{kForward}{Maximum number of terms created by the forward pass
(including the intercept). Default: twice the number of features (in
\code{X}) plus one OR 21 -- whichever is greater.}

\item{pMethod}{Pruning method. Default: \code{"cv"}: select the number of
terms yielding the maximum mean out-of-fold R-Squared over the
cross-validated model fits (CVRSq). See \code{\link[earth]{earth}} for other
possible values.}

\item{nFold}{Number of cross-validation folds. Must be \code{>0} if
\code{pmethod = "cv"}. Default: 5.}

\item{...}{Currently unused.}
}
\value{
A logical vector with length equal to \code{ncol(X)}.
}
\description{
Performs feature selection via "Multivariate Adaptive Regression Splines"/
"Fast MARS" using \code{\link[earth]{earth}}'s implementation.
}
\examples{
data(iris)
Y <- as.numeric(iris$Species=="setosa")
X <- iris[,-which(colnames(iris)=="Species")]
screen.earth(Y, X, binomial(), selector = "cutoff.k.percent", k = 0.75)

data(mtcars)
Y <- mtcars$mpg
X <- mtcars[,-which(colnames(mtcars)=="mpg")]
screen.earth(Y, X, gaussian(), importanceType = "rss")

# based on examples in SuperLearner package
set.seed(1)
n <- 250
p <- 20
X <- matrix(rnorm(n*p), nrow = n, ncol = p)
X <- data.frame(X)
Y <- X[, 1] + sqrt(abs(X[, 2] * X[, 3])) + X[, 2] - X[, 3] + rnorm(n)

library(SuperLearner)
sl = SuperLearner(Y, X, family = gaussian(), cvControl = list(V = 2),
                  SL.library = list(c("SL.glm", "All"),
                                    c("SL.glm", "screen.earth")))
sl
sl$whichScreen
}
