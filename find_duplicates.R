FindDuplic <- function (x)
{
    duplicated(x) | duplicated(x, fromLast = TRUE)
}

FindDuplic (x)

# if the data contains NA Values and you don't want to include these in the matches, add the argument Incomparables=NA to the function
