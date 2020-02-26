## takes a matrix x and premultiplies it by its transpose
transpose_and_premultiply <- function (x) {xtranspose <- t(x)
xtranspose.x <- matrix( NA, nrow=nrow(xtranspose), ncol=ncol(x))
for (i in 1:nrow(xtranspose)){
  for (j in 1:ncol(x)){
    sum(xtranspose[i,]*x[,j]) -> xtranspose.x[i,j]
  }}
return(xtranspose.x)
}
