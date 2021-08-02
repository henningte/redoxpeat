## code to prepare `d` dataset goes here

# import the data that defines which samples are needed
d <-
  read.csv("./analysis/data/derived_data/001-sample-info.csv",
           header = TRUE,
           as.is = TRUE)

# export
usethis::use_data(d, overwrite = TRUE)
