% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fselector.R
\name{screen.FSelector.correlation}
\alias{screen.FSelector.correlation}
\title{Correlation screening algorithm}
\usage{
screen.FSelector.correlation(
  Y,
  X,
  family,
  filter = c("linear.correlation", "rank.correlation"),
  selector = c("cutoff.biggest.diff", "cutoff.k", "cutoff.k.percent"),
  k = switch(selector, cutoff.k = ceiling(0.5 * ncol(X)), cutoff.k.percent = 0.5, NULL),
  verbose = FALSE,
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

\item{filter}{Character string. One of \code{"linear.correlation"} (Pearson)
or \code{"rank.correlation"} (Spearman).}

\item{selector}{A string corresponding to a subset selecting function
implemented in the FSelector package. One of:
\code{\link[FSelector]{cutoff.biggest.diff}},
\code{\link[FSelector]{cutoff.k}}, \code{\link[FSelector]{cutoff.k.percent}},
or \code{"all"}. Note that \code{"all"} is a not a function but indicates
pass-thru should be performed in the case of a \code{filter} which selects
rather than ranks features. Default: \code{"cutoff.biggest.diff"}.}

\item{k}{Passed through to the \code{selector} in the case where \code{selector} is
\code{\link[FSelector]{cutoff.k}} or \code{\link[FSelector]{cutoff.k.percent}}.
Otherwise, should remain NULL (the default). For \code{\link[FSelector]{cutoff.k}},
this is an integer indicating the number of features to keep from \code{X}.
For \code{\link[FSelector]{cutoff.k.percent}}, this is instead the proportion
of features to keep.}

\item{verbose}{Should debugging messages be printed? Default: \code{FALSE}.}

\item{...}{Currently unused.}
}
\value{
A logical vector with length equal to \code{ncol(X)}.
}
\description{
Features are ranked and selected based on the strength of their correlation
with the outcome \code{Y}. Implemented for \code{gaussian()} family only.
}
\examples{
data(mtcars)
Y <- mtcars$mpg
X <- mtcars[,-which(colnames(mtcars)=="mpg")]
screen.FSelector.correlation(Y, X, gaussian(), filter = "rank.correlation")

# based on examples in SuperLearner package
set.seed(1)
n <- 100
p <- 20
X <- matrix(rnorm(n*p), nrow = n, ncol = p)
X <- data.frame(X)
Y <- X[, 1] + sqrt(abs(X[, 2] * X[, 3])) + X[, 2] - X[, 3] + rnorm(n)

library(SuperLearner)
sl = SuperLearner(Y, X, family = gaussian(), cvControl = list(V = 2),
                  SL.library = list(c("SL.glm", "All"),
                                    c("SL.glm", "screen.FSelector.correlation")))
sl
sl$whichScreen
}
