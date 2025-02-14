
library(tidyverse)
library(rmarkdown)
library(dtplyr)
library(lubridate)
library(quarto)

start<-now()

#***IMPORTANT*** make sure you have opened the 'step1_ReadInDate.Rmd' file and completed the set up 
#instructions before running this master processing script


### Step 1 Read in data----------
source('step1_read_in_data.R')





#add custom event mapping
#add custom remark parsing
#add custom protocol parsing


### Step 2 Intermediate Files----------------------
source('step2_create_intermediate_files.R')


end<-now()

end-start

### Step 3 Report Templates------------------------
#add basic report templates
#cohort disease incidence (Location, Lactation, Breed, etc)
#timing of disease (DIM (or Age) and calendar time distributions, Kaplan Meier)
#perfomrance and disease (milk, gain, repro)
