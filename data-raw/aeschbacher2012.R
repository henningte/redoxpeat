## code to prepare `aeschbacher2012` dataset goes here

# import
aeschbacher2012 <- readRDS("./../../data_repo/data/d1/derived/d1.rds")

# export
usethis::use_data(aeschbacher2012, overwrite = TRUE)
