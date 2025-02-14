library(tidyverse)

fxn_assign_disease_template<-function(df){
  df%>%
    mutate(disease = remark_letters1)
}

fxn_assign_disease_bred<-function(df){
  df%>%
    mutate(disease = event)
}