library(readr)
library(here)
library(dplyr)
library(tidyr)

rta_data_orig <- read_csv(here("data","RTAData.csv"), na = c("", "x", "NA"))

rta_data_orig %>% 
  gather(key = "route", value = "transit", `40010`:`41160`) %>%
  write_csv(here("data","M4_data.csv"))


rta_data_tidy <- read_csv(here("data","M4_data.csv"))  
  