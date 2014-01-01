\docType{methods}
\name{create_hstore}
\alias{create_hstore}
\title{Create Postgres Hstore Representation of R objects}
\arguments{
  \item{Obj}{R object. Accepts objects of class
  \code{\link{list}}, \code{\link{boots}} and
  \code{\link{metalocalized}}.}
}
\value{
  character string containing postgres SQL hstore style key
  value pairs.
}
\description{
  This S4 method creates hstore representation of different
  R objects. In general list based key-value pairs are
  transformed into a character based assignment of keys to
  values.
}
\seealso{
  \code{\link{boots}} and \code{\link{boots2db}}
}

