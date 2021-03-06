% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph-nodes.R
\name{graph.nodes}
\alias{graph.nodes}
\title{Return root, end, or branchpoints of an igraph object}
\usage{
graph.nodes(x, type = c("root", "end", "branch"),
  original.ids = "name", exclude.isolated = TRUE)
}
\arguments{
\item{x}{An igraph (or \code{\link{ngraph}}) object}

\item{type}{one of root, end (which includes root) or branch}

\item{original.ids}{Use named attribute to return original vertex ids (when
available). Set to FALSE when this is not desired.}

\item{exclude.isolated}{Do not count isolated vertices as root points
(default)}
}
\description{
Return root, end, or branchpoints of an igraph object
}
\details{
This function underlies \code{\link{rootpoints.igraph}} methods and
  friends. It is conceived of as slightly lower level and end users would
  normally use the \code{rootpoints} methods.

  \code{graph.nodes} should work for any \code{\link{igraph}} object
  (including \code{\link{ngraph}} objects, which inherit from \code{igraph}).
  However the graph must be directed in order to return a root point
}
\examples{
ng=as.ngraph(Cell07PNs[[1]])
# arbitrary vertex identifiers
graph.nodes(ng, type = 'end')
# raw vertex indices
graph.nodes(ng,type = 'end', original.ids = FALSE)
}
\seealso{
\code{\link{rootpoints}}, \code{\link{ngraph}}
}
