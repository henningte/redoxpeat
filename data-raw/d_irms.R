## code to prepare `d_irms` dataset goes here

# packages
library(magrittr)
library(elco)
library(dplyr)

# import the irms data
d_irms <- read.csv("./analysis/data/derived_data/003-CN.csv", header = TRUE)

# import the data that defines which samples are needed
d <- redoxpeat::d

# remove unneeded columns
d_irms <-
  d_irms %>%
  dplyr::select(id_90, C, H, N, O, S, d15N, d13C)

# identify chemical elements
d_irms_ce <- colnames(d_irms)[PeriodicTable::areSymb(colnames(d_irms))]

# set units and errors
d_irms <-
  d_irms %>%
  dplyr::mutate(dplyr::across(dplyr::all_of(d_irms_ce),
                              function(x) quantities::set_quantities(x/100, unit = "g/g", errors = 0)))

# convert to class elco
d_irms[, d_irms_ce] <-
  d_irms[, d_irms_ce] %>%
  purrr::map2_df(colnames(.), function(x, y) elco::elco_new_elco(x, el_symbol = y))

# combine the data
d_irms <-
  d_irms %>%
  dplyr::right_join(d %>%
                      dplyr::select(id_90), by = "id_90")

# sort rows
d_irms <-
  d_irms %>%
  dplyr::arrange()

# export
usethis::use_data(d_irms, overwrite = TRUE)
