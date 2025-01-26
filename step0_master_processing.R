
library(tidyverse)
library(rmarkdown)
library(dtplyr)
library(lubridate)
library(quarto)

start<-now()

#***IMPORTANT*** make sure you have opened the 'step1_ReadInDate.Rmd' file and completed the set up 
#instructions before running this master processing script

### Step 1 ----------
source('step1_read_in_data.R')


### Step 2 ----------------------
source('step2_create_intermediate_files.R')


end<-now()

end-start

