\name{create_df_lines}
\alias{create_df_lines}
\title{Create single line data.frame from time series}
\usage{
  create_df_lines(Obj, type = "main",
    meta_env_name = "meta", vintage_key = NA_character_)
}
\arguments{
  \item{Obj}{time series object or name of time series
  object}

  \item{type}{character based flag, either main or meta.
  Should localized meta information or main data be
  generated.}

  \item{meta_env_name}{character name of the environment
  that stores the metainformation}
}
\description{
  This function creates single line data.frames from time
  series that can be bound together and processed by
  dbWriteTable. This function is a helper function for
  \code{\link{create_db_table}} and is not meant to be used
  as a standalone function.
}
\author{
  Matthias Bannert
}

