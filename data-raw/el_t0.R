## code to prepare `el_t0` dataset goes here

# packages
library(magrittr)
library(dplyr)

# import eac and edc data
el_t0 <- read.csv("./analysis/data/derived_data/002-electrochemical_t0_data.csv", header = TRUE)

# import the data that defines which samples are needed
d <- redoxpeat::d

# remove unneeded samples (discard site MB3 (only one measurement))
el_t0 <-
  el_t0 %>%
  dplyr::filter(id_integrate2 != 28)

# remove unneeded columns and add needed ones
el_t0 <-
  el_t0 %>%
  dplyr::left_join(d %>%
                     dplyr::select(id_integrate2, id_90),
                   by = "id_integrate2") %>%
  dplyr::select(-c(site, depth, measurement_id, c_content, id_integrate2, water))

# add C content for normalization
el_t0 <-
  el_t0 %>%
  dplyr::right_join(redoxpeat::d_irms %>%
                     dplyr::select(id_90, C),
                   by = "id_90")

# set units
el_t0 <-
  el_t0 %>%
  dplyr::mutate(mass = units::set_units(mass, "g"))

# EAC
el_t0_eac <-
  el_t0 %>%
  tidyr::pivot_longer(cols = dplyr::contains("eac"),
                      names_to = "replicate_id",
                      values_to = "eac") %>%
  dplyr::mutate(eac = units::set_units(eac, "umol"),
                eac_c = eac/(errors::drop_errors(C) * mass)) %>%
  dplyr::mutate(measurement_id = rep(1:8, length(unique(id_90)))) %>%
  dplyr::select(id_90, measurement_id, eac, eac_c)

# EDC
el_t0_edc <-
  el_t0 %>%
  tidyr::pivot_longer(cols = dplyr::contains("edc"),
                      names_to = "replicate_id",
                      values_to = "edc") %>%
  dplyr::mutate(edc = units::set_units(edc, "umol"),
                edc_c = edc/(errors::drop_errors(C) * mass)) %>%
  dplyr::mutate(measurement_id = rep(1:8, length(unique(id_90)))) %>%
  dplyr::select(id_90, measurement_id, edc, edc_c)

# bind values back
el_t0 <-
  el_t0 %>%
  dplyr::select(!dplyr::contains(c("eac", "edc"))) %>%
  dplyr::left_join(el_t0_eac, by = c("id_90")) %>%
  dplyr::left_join(el_t0_edc, by = c("id_90", "measurement_id"))

# add metadata from d
el_t0 <-
  el_t0 %>%
  dplyr::left_join(d %>%
                     dplyr::select(id_90, site_label, site_name, depth_upper),
                   by = "id_90")

# sort columns and rows
el_t0 <-
  el_t0 %>%
  dplyr::select(id_90, site_label, site_name, depth_upper, measurement_id, mass, C, eac, eac_c, edc, edc_c) %>%
  dplyr::arrange(id_90)

# export
usethis::use_data(el_t0, overwrite = TRUE)
