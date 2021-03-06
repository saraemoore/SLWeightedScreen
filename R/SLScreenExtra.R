#' SLScreenExtra: A collection of screening algorithms for SuperLearner
#'
#' The SLScreenExtra package provides feature selection or \code{screen.*()}
#' functions that plug into the R package for the ensemble learner
#' \code{\link[SuperLearner]{SuperLearner}}. Some of the screening
#' algorithms (\code{screen.wgtd.*()}) in this package utilize observation
#' weights (\code{obsWeights}) in their calculations.
#'
#' @section Filter methods:
#'
#' \itemize{
#'   \item{Correlation:}{\itemize{
#'  	\item{\code{\link{screen.wgtd.corP}}}
#' 		\item{\code{\link{screen.wgtd.corRank}}}
#' 		\item{\code{\link{screen.FSelector.correlation}}}
#' 	 }}
#'   \item{Comparison test:}{\itemize{
#' 		\item{\code{\link{screen.wgtd.ttest}}}
#'  	\item{\code{\link{screen.wgtd.ttestP}}}
#'  	\item{\code{\link{screen.FSelector.chi.squared}}}
#'  	\item{\code{\link{screen.FSelector.oneR}}}
#' 	 }}
#'   \item{\code{\link{screen.FSelector.entropy}}}
#'   \item{\code{\link{screen.FSelector.relief}}}
#' }
#'
#' @section Embedded methods:
#'
#' \itemize{
#'   \item{Regularized/penalized regression:}{\itemize{
#'  	\item{\code{\link{screen.wgtd.lasso}}}
#' 		\item{\code{\link{screen.wgtd.elasticnet}}}
#' 	 }}
#'   \item{Multivariate adaptive regression splines:}{\itemize{
#'  	\item{\code{\link{screen.earth}}}
#' 	 }}
#'   \item{Random decision forests:}{\itemize{
#'  	\item{\code{\link{screen.randomForest.imp}}}
#' 		\item{\code{\link{screen.ranger}}}
#' 		\item{\code{\link{screen.FSelector.random.forest.importance}}}
#' 	 }}
#' }
#'
#' @section Feature subset space search methods:
#'
#' \itemize{
#'   \item{\code{\link{screen.FSelector.cfs}}}
#'   \item{\code{\link{screen.FSelector.consistency}}}
#' }
#'
#' @section Utility methods:
#' \itemize{
#'   \item{Produce \code{\link[broom]{tidy}} output from a
#' 		\code{\link[SuperLearner]{SuperLearner}} or
#' 		\code{\link[SuperLearner]{CV.SuperLearner}} object:}{\itemize{
#'		\item{\code{\link{tidy.SuperLearner}}}
#'		\item{\code{\link{tidy.CV.SuperLearner}}}
#' 	}}
#' }
#'
#' @docType package
#' @name SLScreenExtra
NULL
