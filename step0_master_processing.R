
library(tidyverse)
library(rmarkdown)
library(dtplyr)

start<-now()

#***IMPORTANT*** make sure you have opened the 'step1_ReadInDate.Rmd' file and completed the set up 
#instructions before running this master processing script

### Step 1 ----------
rmarkdown::render(input = 'step01_read_in_data.Rmd')

### Step 2 ----------------------
rmarkdown::render(input = 'step02_create_intermediate_files.Rmd')

end<-now()

end-start

