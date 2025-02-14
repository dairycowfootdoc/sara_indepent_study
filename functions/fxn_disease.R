library(tidyverse)

fxn_assign_disease_template<-function(df){
  df%>%
    mutate(disease = remark_letters1)
}