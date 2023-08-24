fun_eval <- function(f) {
  result <- function(data, output) {
    t = data[1]
    x = data[2]
    return(f(x=x, t=t))
  }
  
  return(result)
}

fun_zero <- function(x, output){
  return(0)
}