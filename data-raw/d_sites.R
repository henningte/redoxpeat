## code to prepare `d_sites` dataset goes here

# packages
library(magrittr)
library(sf)
library(raster)
library(dplyr)
library(purrr)
library(tibble)
library(stringr)

# data import
d_sites <- read.csv("./analysis/data/derived_data/007-sites.csv", header = TRUE, as.is = TRUE)

# arrange d_sites and convert to an sf object
d_sites_sf <-
  d_sites %>%
  dplyr::arrange(site_id) %>%
  sf::st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

# get file paths to bowerbird files
bb_status <- readRDS("./../../data_repo/bowerbird_status.rds")

# elevation data
d_altitude <- raster::raster(bb_status$files[stringr::str_detect(bb_status$name, "GMTED2010")][[1]]$file[[11]])

# get temperature data
tmp_files <-
  bb_status$files[stringr::str_detect(bb_status$name, "WorldClim version 2.1 1970-2000 average global temperature data, 30 sec resolution, for each month")][[1]] %>%
  dplyr::filter(note == "decompressed") %>%
  dplyr::select(file) %>%
  unlist(recursive = FALSE)

d_tmp <-
  purrr::map_df(tmp_files, function(x) {
    month <-
      stringr::str_extract(x, pattern = "[:digit:]{2}\\.tif$") %>%
      stringr::str_remove(pattern = "\\.tif") %>%
      as.integer()
    tmp <- raster::extract(raster::raster(x), d_sites_sf,
                           method = "simple", buffer = NULL, small = FALSE, df = FALSE)
    tibble::tibble(
      month = month,
      site_id = d_sites_sf$site_id,
      tmp = tmp
    )
  })

# get precipitation data
prc_files <-
  bb_status$files[stringr::str_detect(bb_status$name, "WorldClim version 2.1 1970-2000 average global precipitation data, 30 sec resolution, for each month")][[1]] %>%
  dplyr::filter(note == "decompressed") %>%
  dplyr::filter(stringr::str_detect(file, pattern = "readme\\.txt", negate = TRUE)) %>%
  dplyr::select(file) %>%
  unlist(recursive = FALSE)

d_prc <-
  purrr::map_df(prc_files, function(x) {
    month <-
      stringr::str_extract(x, pattern = "[:digit:]{2}\\.tif$") %>%
      stringr::str_remove(pattern = "\\.tif") %>%
      as.integer()
    prc <- raster::extract(raster::raster(x), d_sites_sf,
                           method = "simple", buffer = NULL, small = FALSE, df = FALSE)
    tibble::tibble(
      month = month,
      site_id = d_sites_sf$site_id,
      prc = prc
    )
  })

# add elevation data
d_sites <-
  d_sites %>%
  dplyr::mutate(
    altitude = raster::extract(d_altitude,
                               d_sites_sf,
                               method = "simple",
                               buffer = NULL,
                               small = FALSE,
                               df = FALSE)
  )

# add climate data
d_climate <-
  dplyr::left_join(d_tmp, d_prc, by = c("site_id", "month")) %>%
  dplyr::left_join(d_sites, by = "site_id")

# summarize climate data
d_climate_summary <-
  d_climate %>%
  dplyr::group_by(site_label) %>%
  dplyr::summarise(
    site_id = unique(site_id),
    site_name = unique(site_name),
    peatland_type = dplyr::first(peatland_type),
    current_vegetation = unique(current_vegetation),
    longitude = unique(longitude),
    latitude = unique(latitude),
    altitude = unique(altitude),
    tmp_mean = mean(tmp),
    prc_sum = sum(prc),
    .groups = "drop"
  ) %>%
  dplyr::mutate(site_label = factor(site_label, levels = site_label[site_id])) %>%
  dplyr::arrange(site_id)

# add climate data to d_sites
d_sites <-
  dplyr::left_join(d_sites,
                   d_climate_summary %>%
                     dplyr::select(-peatland_type, -current_vegetation, -longitude, -latitude, -altitude),
                   by = c("site_id", "site_label", "site_name"))

# export
usethis::use_data(d_sites, overwrite = TRUE)
