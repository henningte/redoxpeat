## code to prepare `d_mir` dataset goes here

# packages
library(magrittr)
library(ir)
library(dplyr)

# import the mirs data
d_mir <-
  list.files("./analysis/data/derived_data/mir/",
             full.names = TRUE,
             pattern = "\\.csv$") %>%
  ir::ir_import_csv()
d_mir1 <-
  list.files("./analysis/data/derived_data/mir/",
             full.names = TRUE,
             pattern = "\\.spc$") %>%
  ir::ir_import_spc()

# import the data that defines which samples are needed
d <- redoxpeat::d

# combine the data
d_mir <-
  dplyr::bind_rows(d_mir,
                   d_mir1 %>%
                     dplyr::select(measurement_id, sample_id, spectra) %>%
                     dplyr::mutate(measurement_id = max(d_mir$measurement_id) + seq_len(nrow(.)))
                   )

# filter only needed data
d_mir <-
  d_mir %>%
  dplyr::right_join(d %>%
                      dplyr::select(id_ftir, id_90) %>%
                      dplyr::rename(sample_id = id_ftir), by = "sample_id")

# sort columns and rows
d_mir <-
  d_mir %>%
  dplyr::mutate(sample_id = id_90) %>%
  dplyr::select(id_90, sample_id, measurement_id, spectra) %>%
  dplyr::arrange(id_90)

# export
usethis::use_data(d_mir, overwrite = TRUE)
