library(testthat)
library(nat)
library(httr)

# suppress RGL in headless environments (some CRAN build machines fail otherwise)
if(!interactive())
  Sys.setenv(RGL_USE_NULL=TRUE)

# Is internet accessible?
internet.ok = identical(
  try(
    status_code(
      HEAD("http://flybrain.mrc-lmb.cam.ac.uk/", timeout(2))
    ),
    silent = TRUE
  ),
  200L
)

if(Sys.getenv('NOT_CRAN') == "true" && internet.ok) {
  # note that we want to run all tests requiring internet access
  Sys.setenv(NAT_INTERNET_TESTS="TRUE")
  # Run all test files
  test_check("nat")
} else {
  # We're on CRAN or flybrain is inaccessible, so don't run anything involving 
  # remote files
  Sys.setenv(NAT_INTERNET_TESTS="")
  test_check("nat", filter="^[^.]+")
}
