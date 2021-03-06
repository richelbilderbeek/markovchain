% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ctmcProbabilistic.R
\name{is.CTMCirreducible}
\alias{is.CTMCirreducible}
\title{Check if CTMC is irreducible}
\usage{
is.CTMCirreducible(ctmc)
}
\arguments{
\item{ctmc}{a ctmc-class object}
}
\value{
a boolean value as described above.
}
\description{
This function verifies whether a CTMC object is irreducible
}
\examples{
energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                     byrow = byRow, generator = gen, 
                     name = "Molecular Transition Model")
is.CTMCirreducible(molecularCTMC)

}
\references{
Continuous-Time Markov Chains, Karl Sigman, Columbia University
}
\author{
Vandit Jain
}
