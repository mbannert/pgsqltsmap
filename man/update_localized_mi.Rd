\name{update_localized_mi}
\alias{update_localized_mi}
\title{Update Localized Meta Information in the Database}
\usage{
  update_localized_mi(con, Obj, meta_env_name = "meta",
    overwrite = F)
}
\arguments{
  \item{con}{A postgreSQL connection object}

  \item{Obj}{character name of time series}

  \item{meta_env_name}{}

  \item{overwrite}{logical should the localized meta
  information in memory overwrite the complete local meta
  information for this time series in the database?}
}
\description{
  This function updates localized meta information in the
  database. Either the entire localized meta information
  for one time series is overwritten and replaced by the
  localized meta information in memory or only added meta
  series that do not exist in the database are added.
}
\author{
  Matthias Bannert
}

