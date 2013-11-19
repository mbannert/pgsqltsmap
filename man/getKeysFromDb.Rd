\name{getKeysFromDb}
\alias{getKeysFromDb}
\title{Get one or multiple key from database by chunks}
\usage{
  getKeysFromDb(..., conn = con,
    relation = "timeseries_main")
}
\arguments{
  \item{...}{chunks of class character that should be use
  to narrow down selected keys}

  \item{conn}{a postgreSQL connection object}
}
\description{
  This function reads all keys that qualify for the like
  condition specified in the arguments of this function.
}
\author{
  Matthias Bannert
}
\seealso{
  \code{\link{boots2db} and \code{\link{bootsKey}}}
}

