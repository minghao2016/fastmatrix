\name{duplication}
\alias{duplication}

\title{Duplication matrix}
\description{
  This function returns the duplication matrix of order \eqn{n} which transforms,
  for a symmetric matrix \eqn{{\bf{A}}}, \code{vech}\eqn{({\bf{A}})} into \code{vec}\eqn{({\bf{A}})}.
}
\usage{
  duplication(n = 1, matrix = FALSE, condensed = FALSE)
}
\arguments{
  \item{n}{ order of the duplication matrix.}
  \item{matrix}{ a logical indicating whether the duplication matrix will be returned.}
  \item{condensed}{ logical. Information should be returned in compact form?.}
}
\details{
  This function is a wrapper function for the function \code{dupl.info}. This function
  provides the minimum information required to create the duplication matrix. If option
  \code{matrix = FALSE} the duplication matrix is stored in two vectors containing the
  coordinate list of indexes for rows and columns. Option \code{condensed = TRUE} only
  returns vector of indexes for the columns of duplication matrix.

  \bold{Warning:} \code{matrix = TRUE} is \bold{not} recommended, unless the order \code{n}
  be small. This matrix can require a huge amount of storage.
}
\value{
  Returns an \eqn{n^2} by \eqn{n(n + 1)/2} matrix (if requested).
}
\references{
  Magnus, J.R., Neudecker, H. (1980).
  The elimination matrix, some lemmas and applications.
  \emph{SIAM Journal on Algebraic Discrete Methods} \bold{1}, 422-449.

  Magnus, J.R., Neudecker, H. (2007).
  \emph{Matrix Differential Calculus with Applications in Statistics and Econometrics}, 3rd Edition.
  Wiley, New York.
}
\seealso{
  \code{\link{dupl.info}}
}
\examples{
z <- duplication(n = 100, condensed = TRUE)
object.size(z) # 40.5 Kb of storage

z <- duplication(n = 100, condensed = FALSE)
object.size(z) # 80.6 Kb of storage

D100 <- duplication(n = 100, matrix = TRUE)
object.size(D100) # 202 Mb of storage, do not request this matrix!

# a small example
D3 <- duplication(n = 3, matrix = TRUE)
a <- matrix(c( 1, 2, 3,
               2, 3, 4,
               3, 4, 5), nrow = 3)
upper <- vech(a)
v <- D3 \%*\% upper
all(vec(a) == as.vector(v)) # vectors are equal!
}
\keyword{array}
\keyword{algebra}
