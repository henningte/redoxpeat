## code to prepare `fe_t0` dataset goes here

# packages
library(magrittr)
library(elco)
library(dplyr)

# iron speciation in solids and dissolved fraction of each sample from acid extraction
fe_t0 <- read.csv("./analysis/data/derived_data/008-electrochemical_t0_iron_data.csv")

# import the data that defines which samples are needed
d <- redoxpeat::d

# rename columns
fe_t0 <-
  fe_t0 %>%
  dplyr::rename(id_90 = "Nr.",
                mass = "Weight",
                fe2 = "Fe2..umol.L",
                fe3 = "Fe3..umol.L")

# correct ids for degerö
fe_t0$id_90[fe_t0$site_label == "degero1"] <- c(33, 35, 37, 39)

# add units
fe_t0 <-
  fe_t0 %>%
  dplyr::mutate(water = units::set_units(water, "mL"),
                mass = units::set_units(mass, "g"),
                fe2 = units::set_units(fe2, "umol/L"),
                fe3 = units::set_units(fe3, "umol/L"))

# compute the total amount of the different iron species in the samples [µmol/g]
fe_t0_dilution_factor = units::set_units(5, "1") # the measurement solution was diluted by a factor of 5.
fe_t0 <-
  fe_t0 %>%
  dplyr::mutate(fe2 = (fe2 * water * fe_t0_dilution_factor)/mass,
                fe3 = (fe3 * water * fe_t0_dilution_factor)/mass)

# compute the total amount of iron in the sample
fe_t0$fe_tot <- fe_t0$fe2 + fe_t0$fe3
fe_t0$fe_tot <-
  elco::elco_new_elco(
    quantities::set_quantities(fe_t0$fe_tot,
                               unit = as.character(attr(fe_t0$fe_tot, "units")),
                               errors = rep(0, nrow(fe_t0)),
                               mode = "standard"),
    el_symbol = "Fe")

# filter variables
fe_t0 <-
  fe_t0 %>%
  dplyr::select(id_90, mass, water, fe2, fe3, fe_tot)

# combine the data
fe_t0 <-
  fe_t0 %>%
  dplyr::right_join(d %>%
                      dplyr::select(id_90), by = "id_90")


# sort rows
fe_t0 <-
  fe_t0 %>%
  dplyr::arrange(id_90)

# export
usethis::use_data(fe_t0, overwrite = TRUE)
