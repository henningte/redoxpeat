## code to prepare `tan2017` dataset goes here

# packages
library(units)
library(magrittr)
library(dplyr)

# import
tan2017 <- readRDS("./../../data_repo/data/d3/derived/d3.rds")

# adjust units
tan2017 <-
  tan2017 %>%
  dplyr::mutate(
    tmp_eac = tmp_eac %>% as.numeric() %>% units::set_units(degree_C),
    tmp_edc = tmp_edc %>% as.numeric() %>% units::set_units(degree_C)
  )

# export
usethis::use_data(tan2017, overwrite = TRUE)
