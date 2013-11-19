\name{df2list}
\alias{df2list}
\title{Get key / value pairs from a two-column data.frame}
\usage{
  df2list(df, n = 1, v = 2)
}
\arguments{
  \item{df}{data.frame that should be turned into a named
  list. Note that only two specified columns will be used.}

  \item{n}{numeric position of the name column}

  \item{v}{numeric position of the value column}
}
\description{
  This function is used as a helper function to turn a
  standard data.frame into a named list. The user may
  specify the values and the names column.
}
\author{
  Matthias Bannert
}

