is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  
  end <- as.integer(sqrt(n))
  for (i in 2:end) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  
  return(TRUE)
}

start <- as.numeric(Sys.time()) * 1000

c <- 0
for (i in 0:8999999) {
  if (is_prime(i)) {
    c <- c + 1
  }
}

print(c)
print((as.numeric(Sys.time())*1000) - start)
