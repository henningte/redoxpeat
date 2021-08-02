## code to prepare `ihss` dataset goes here

# import
ihss <- readRDS("./../../data_repo/data/d2/derived/d2.rds")

# export
usethis::use_data(ihss, overwrite = TRUE)
