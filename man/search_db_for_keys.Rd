\name{search_db_for_keys}
\alias{search_db_for_keys}
\title{Get one or multiple keys from database by chunks}
\usage{
  search_db_for_keys(..., conn,
    relation = "timeseries_main")
}
\arguments{
  \item{...}{chunks of class character that should be used
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

