## code to prepare `walpen2018` dataset goes here

# import
walpen2018 <- readRDS("./../../data_repo/data/d5/derived/d5.rds")

# export
usethis::use_data(walpen2018, overwrite = TRUE)
