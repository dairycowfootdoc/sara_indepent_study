library(tidyverse)

fxn_add_location_event_default <- function(df){
  df%>%
    mutate(
      location_event = set_location_event
      )
}