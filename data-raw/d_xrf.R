## code to prepare `d_xrf` dataset goes here

# packages
library(magrittr)
library(elco)
library(dplyr)

# import the xrf data
d_xrf <- read.csv("./analysis/data/derived_data/004-xrf.csv", header = TRUE)

# import the data that defines which samples are needed
d <- redoxpeat::d

# identify chemical elements
d_xrf_ce <- colnames(d_xrf)[PeriodicTable::areSymb(colnames(d_xrf))]

# set units and errors
d_xrf <-
  d_xrf %>%
  dplyr::mutate(
    Na = units::set_units(Na, "ug/g"),
    Mg = units::set_units(Mg, "ug/g"),
    Al = units::set_units(Al, "ug/g"),
    Si = units::set_units(Si, "ug/g"),
    P = units::set_units(P, "ug/g"),
    S = units::set_units(S, "ug/g"),
    Cl = units::set_units(Cl, "ug/g"),
    Ti = units::set_units(Ti, "ug/g"),
    Cr = units::set_units(Cr, "ug/g"),
    Mn = units::set_units(Mn, "ug/g"),
    Cu = units::set_units(Cu, "ug/g"),
    Zn = units::set_units(Zn, "ug/g"),
    As = units::set_units(As, "ug/g"),
    Br = units::set_units(Br, "ug/g"),
    Rb = units::set_units(Rb, "ug/g"),
    Sr = units::set_units(Sr, "ug/g"),
    Ba = units::set_units(Ba, "ug/g"),
    Pb = units::set_units(Pb, "ug/g"),
    K = units::set_units(K/100, "g/g"),
    Ca = units::set_units(Ca/100, "g/g"),
    Fe = units::set_units(Fe/100, "g/g")
  ) %>%
  dplyr::mutate(dplyr::across(dplyr::all_of(d_xrf_ce),
                              errors::set_errors, value = 0))

# convert to class elco
d_xrf[, -1] <-
  d_xrf[, -1] %>%
  purrr::map2_df(colnames(.), function(x, y) elco::elco_new_elco(x, el_symbol = y))

# combine the data
d_xrf <-
  d_xrf %>%
  dplyr::right_join(d %>%
                      dplyr::select(id_90), by = "id_90")

# sort rows
d_xrf <-
  d_xrf %>%
  dplyr::arrange()

# export
usethis::use_data(d_xrf, overwrite = TRUE)
