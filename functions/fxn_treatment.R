library(tidyverse)

fxn_assign_treatment_template<-function(df){
  df%>%
    mutate(treatment = protocols_letters1)
}