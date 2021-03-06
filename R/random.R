# Methods to generate random markov chains

normalizeMatrix <- function(matrix, byrow = TRUE) {
  margin <- ifelse (byrow, 1, 2)
  n <- nrow(matrix)
  
  result <- sapply(1:n, function(i) {
    row <- matrix[i, ]
    rowSum <- sum(row)
    
    if (rowSum == 0) {
      values <- c(rep(0, i - 1), 1, rep(0, n - i))
      values
    } else {
      row / rowSum
    }
  })
  
  # If we want the result by rows, we have to transpose the matrix,
  # since the apply method with margin = 1 (over rows) returns the result
  # by columns
  if (byrow)
    t(result)
  else
    result
}


# Returns a random stochastic matrix
randomStochasticMatrix <- function(n, zeroProb, byrow = TRUE) {
  numRandom <- n * n
  randomNums <- stats::runif(numRandom)
  
  remainProb <- (1 - zeroProb) / numRandom
  probs <- c(zeroProb, rep(remainProb, numRandom))
  
  entries <- sample(c(0, randomNums), numRandom, prob = probs, replace = TRUE)
  
  result <- matrix(entries, n, n, byrow)
  result <- normalizeMatrix(result, byrow)
  
  result
}


randomMarkovChain <- function(n, zeroProb = 0.95, byrow = TRUE) {
  matrix <- randomStochasticMatrix(n, zeroProb, byrow)
  new("markovchain", transitionMatrix = matrix, byrow = byrow)
}