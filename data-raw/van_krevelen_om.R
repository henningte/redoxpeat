## code to prepare `van_krevelen_om` dataset goes here

# packages
library(magrittr)
library(dplyr)

# import
van_krevelen_om <-
  readRDS("./../../data_repo/data/d4/derived/d4.rds") %>%
  dplyr::mutate_if(is.numeric, as.numeric) %>%
  dplyr::rename(`H:C` = "hc_center",
                `O:C` = "oc_center")

# export
usethis::use_data(van_krevelen_om, overwrite = TRUE)
