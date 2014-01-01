\name{create_line}
\alias{create_line}
\title{Create a single line data.table from a time series}
\usage{
  create_line(ts_key, ts_env, meta_env_name)
}
\arguments{
  \item{ts_key}{character time series key}

  \item{environment}{that contains the time series}

  \item{meta_env_name}{name of the meta environment}
}
\description{
  This function is typically not called directly. it is
  used to create single line data.tables from univariate
  time series object. This is useful when multiple objects
  are summarized in one data.table. Time series are stored
  in character representation of hstore key value pairs. #'
}
\author{
  Matthias Bannert
}
\seealso{
  \code{\link{rbindList}},\code{\link{ts_env2data.table}}
}

