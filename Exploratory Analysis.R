library(tidyverse) 
library(Hmisc)
library(funModeling) 

basic_eda <- function(data)
{
  glimpse(data)
  df_status(data)
  freq(data) 
  profiling_num(data)
  plot_num(data)
  describe(data)
}

basic_eda (Data)
