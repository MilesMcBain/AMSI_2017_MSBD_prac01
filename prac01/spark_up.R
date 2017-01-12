library(sparklyr)
library(readr)
library(here)
library(dplyr)
library(tidyr)
library(visdat)


#initialise data files
rta_data_file <- here("data","M4_data.csv")
rta_lengths_file <- here("data", "RouteLengthApprox.csv")

#initialise spark
sc <- spark_connect(master = "local", version = "2.0.2")

#read data
rta_data <- spark_read_csv(sc, "rta_data", rta_data_file)
rta_lengths <- spark_read_csv(sc, "rta_lengths", rta_lengths_file)

#Data stats
head(rta_data)
nrow(rta_data) #7370142 million rows

#Explore data
rta_sample <-
  rta_data %>%
  sample_n(10000) %>%
  collect() %>%
  select(-rownumber)

vis_dat(rta_sample)
# 'Character' means a string. So we've got some work do to to fix the types.

#Is the data tidy?
#What about joining on the route length?

#Tidy data
rta_tidy <-
  rta_data %>%


