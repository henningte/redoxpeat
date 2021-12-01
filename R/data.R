#' Compilation of mid infrared spectra of peat samples analyzed in the manuscript.
#'
#' A dataset containing the compiled raw (unprocessed) and preprocessed mid
#' infrared spectra for peat samples used in this study. Spectra that could not
#' be obtained as raw data were included as already baseline corrected spectra.
#'
#' @format An object of class \code{\link[ir:ir_new_ir]{ir}} with 59 rows and 4
#' variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{sample_id}{The same as id_90.}
#'   \item{measurement_id}{An integer representing an increasing IDs for
#'   individual measurements.}
#'   \item{spectra}{The mid infrared spectra}.
#' }
"d_mir"

#' Compilation of element content and isotope signature data for the peat samples analyzed in the manuscript.
#'
#' A dataset containing the compiled element content and isotope signature data for
#' peat samples used in this study.
#'
#' @format A data frame with 59 rows and 8 variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{C}{The sample C content [g/g].}
#'   \item{N}{The sample N content [g/g].}
#'   \item{H}{The sample H content [g/g].}
#'   \item{O}{The sample O content [g/g].}
#'   \item{S}{The sample S content [g/g].}
#'   \item{d15N}{The isotope signature of \eqn{^{15}}N
#'   (\eqn{\delta^{15}}N\textsubscript{air}) [\textperthousand].}
#'   \item{d13C}{The isotope signature of \eqn{^{13}}C
#'   (\eqn{\delta^{13}}C\textsubscript{VPDB}) [\textperthousand].}
#' }
"d_irms"

#' Compilation of element content data from wavelength-dispersive X-ray fluorescence spectroscopy for the peat samples analyzed in the manuscript.
#'
#' A dataset containing the compiled element content data from
#' wavelength-dispersive X-ray fluorescence spectroscopy for the peat samples
#' analyzed in the manuscript.
#'
#' @format A data frame with 59 rows and 22 variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{Na}{The sample Na content [µg/g].}
#'   \item{Mg}{The sample Mg content [µg/g].}
#'   \item{Al}{The sample Al content [µg/g].}
#'   \item{Si}{The sample Si content [µg/g].}
#'   \item{P}{The sample P content [µg/g].}
#'   \item{S}{The sample S content [µg/g].}
#'   \item{Cl}{The sample Cl content [µg/g].}
#'   \item{K}{The sample K content [g/g].}
#'   \item{Ca}{The sample Ca content [g/g].}
#'   \item{Ti}{The sample Ti content [µg/g].}
#'   \item{Cr}{The sample Cr content [µg/g].}
#'   \item{Mn}{The sample Mn content [µg/g].}
#'   \item{Fe}{The sample Fe content [g/g].}
#'   \item{Cu}{The sample Cu content [µg/g].}
#'   \item{Zn}{The sample Zn content [µg/g].}
#'   \item{As}{The sample As content [µg/g].}
#'   \item{Br}{The sample Br content [µg/g].}
#'   \item{Rb}{The sample Rb content [µg/g].}
#'   \item{Sr}{The sample Sr content [µg/g].}
#'   \item{Ba}{The sample Ba content [µg/g].}
#'   \item{Pb}{The sample Pb content [µg/g].}
#' }
"d_xrf"

#' EAC and EDC values for the peat samples analyzed in the manuscript.
#'
#' A dataset containing the EAC and EDC data for peat samples used in this
#' study.
#'
#' @format A data frame with 472 rows and 11 variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{site_label}{A character vector with site labels for sites
#'   where the peat samples were taken.}
#'   \item{site_label}{A character vector with site names for sites
#'   where the peat samples were taken.}
#'   \item{depth_upper}{A numeric vector with the depth of the upper boundary
#'   of the peat layers from which the samples were taken [cm].}
#'   \item{measurement_id}{An integer representing the ID of replicate
#'   measurements, nested within id_90.}
#'   \item{mass}{The mass of the sample in the suspension [g].}
#'   \item{C}{The sample C content [g/g].}
#'   \item{eac}{The measured electron accepting capacity (EAC) [µmol].}
#'   \item{eac_c}{The EAC normalized to the sample's C content
#'   [µmol C\eqn{_\text{C}^{-1}}].}
#'   \item{edc}{The measured electron donating capacity (EDC) [µmol].}
#'   \item{edc_c}{The EDC normalized to the sample's C content
#'   [µmol C\eqn{_\text{C}^{-1}}].}
#' }
"el_t0"

#' Contents of different iron ions and total iron in the peat samples analyzed in the manuscript.
#'
#' A dataset containing the concentrations of different iron ions and total iron
#' as obtained by acid extraction in the analyzed peat samples.
#'
#' @format A data frame with 59 rows and 6 variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{mass}{The mass of the sample in the suspension [g].}
#'   \item{fe2}{The concentration of Fe\eqn{^{2+}} in the samples [µmol/g].}
#'   \item{fe3}{The concentration of Fe\eqn{^{3+}} in the samples [µmol/g].}
#'   \item{fe_tot}{fe2 + fe3 [µmol/g].}
#' }
"fe_t0"

#' Information on the sites where peat samples were collected.
#'
#' A dataset containing basic information on the peatland sites where peat
#' samples were collected from for this study.
#'
#' @format A data frame with 15 rows and 10 variables:
#' \describe{
#'   \item{site_id}{An integer representing a unique ID for each site.}
#'   \item{site_label}{A character vector with the site labels used in the
#'   manuscript.}
#'   \item{site_name}{A character vector with the site names.}
#'   \item{longitude}{A numeric vector with the longitude for each site.}
#'   \item{latitude}{A numeric vector with the latitude for each site.}
#'   \item{altitude}{A numeric vector with the altitude for each site, as
#'   extracted from the median values of the GMTED2010 raster files
#'   \insertCite{Danielson.2011}{redoxpeat}.}
#'   \item{peatland_type}{A character vector with a classification of the sites
#'   as bogs or fens following available studies for the respective sites or
#'   from own investigations following concepts in
#'   \insertCite{Rydin.2013}{redoxpeat}.}
#'   \item{current_vegetation}{A character vector with species names/plant
#'   functional groups of the dominant current vegetation at the sites.}
#'   \item{tmp_mean}{A numeric vector with the mean annual temperature
#'   [\eqn{^\circ}C] 1970 to 2000 derived from WorldClim version 2.1 climate data
#'   (30 seconds spatial resolution, monthly temporal resolution)
#'   \insertCite{Fick.2017}{redoxpeat}.}
#'   \item{prc_sum}{A numeric vector with the annual total precipitation
#'   [mm] averaged over 1970 to 2000 derived from WorldClim version 2.1 climate
#'   data (30 seconds spatial resolution, monthly temporal resolution)
#'   \insertCite{Fick.2017}{redoxpeat}.}
#' }
#' @source
#'      \insertCite{Fick.2017}{redoxpeat}
#'      \insertCite{Danielson.2011}{redoxpeat}
#' @references
#'      \insertAllCited{}
"d_sites"

#' General information to peat samples analyzed in the manuscript.
#'
#' A dataset containing general information to the peat samples analyzed in
#' this manuscript (sample IDs, assignments to sites, depth layers, file names
#' of MIRS files).
#'
#' @format A data frame with 59 rows and 8 variables:
#' \describe{
#'   \item{id_90}{An integer representing the sample IDs used in the
#'   manuscript's computations.}
#'   \item{site_label}{A character vector with the site labels used in the
#'   manuscript.}
#'   \item{site_name}{A character vector with the site names.}
#'   \item{site_order}{A numeric vector representing the order in which sites
#'   are typically displayed in the manuscript.}
#'   \item{depth_upper}{A numeric vector with the upper depth of each
#'   peat layer from the ground surface [cm].}
#'   \item{depth_lower}{A numeric vector with the lower depth of each
#'   peat layer from the ground surface [cm].}
#'   \item{id_ftir}{A character vector with the labels of the mid infrared
#'   spectra for each peat layer.}
#'   \item{id_integrate2}{An integer representing the sample IDs used in the
#'   manuscript's computations (this is a reference ID, additional to id_90).}
#' }
"d"

#' Chemical properties of several International Humic Substances Society reference humic substances.
#'
#' A dataset containing chemical properties of several International Humic
#' Substances Society reference humic substances(element contents, isotope
#' signatures, water content, ash content)
#' \insertCite{HuffmanLaboratories.NA}{redoxpeat}.
#'
#' @format A data frame with 37 rows and 15 variables:
#' \describe{
#'   \item{type}{A character vector with the type of the IHSS reference HS.}
#'   \item{name}{A character vector with the HS name.}
#'   \item{available}{A logical vector indicating if the reference HS is
#'   still available.}
#'   \item{catalog_number}{A character vector with the catalog number of the
#'   reference HS.}
#'   \item{H2O}{A numeric vector with the water content [g/g].}
#'   \item{ash_content}{A numeric vector with the ash content (inorganic
#'   residue in a dry sample) [g/g].}
#'   \item{C}{A numeric vector with the C content [g/g].}
#'   \item{H}{A numeric vector with the H content [g/g].}
#'   \item{N}{A numeric vector with the N content [g/g].}
#'   \item{O}{A numeric vector with the O content [g/g].}
#'   \item{S}{A numeric vector with the S content [g/g].}
#'   \item{P}{A numeric vector with the P content [g/g].}
#'   \item{d13C}{The isotope signature of \eqn{^{13}}C
#'   (\eqn{\delta^{13}}C\textsubscript{VPDB}) [\textperthousand].}
#'   \item{d15N}{The isotope signature of \eqn{^{15}}N
#'   (\eqn{\delta^{15}}N\textsubscript{air}) [\textperthousand].}
#'   \item{P_comment}{A character vector representing the upper bound of P
#'   contents if P was not quantifiable.}
#' }
#' @source
#'      http://humic-substances.org/elemental-compositions-and-stable-isotopic-ratios-of-ihss-samples/
#'      \insertCite{HuffmanLaboratories.NA}{redoxpeat}
#' @references
#'    \insertAllCited{}
"ihss"

#' EAC and EDC values for various HS derived from \insertCite{Aeschbacher.2012;textual}{redoxpeat}.
#'
#' A dataset containing EAC and EDC values for several IHSS reference HS as
#' derived from \insertCite{Aeschbacher.2012;textual}{redoxpeat}. Data were
#' derived from figure 4 in the publication using the R package
#' \insertCite{Poisot.2011}{redoxpeat}.
#'
#' @format A data frame with 15 rows and 7 variables:
#' \describe{
#'   \item{EAC}{A numeric vector with the EAC [mmol/g].}
#'   \item{EDC}{A numeric vector with the EAC [mmol/g].}
#'   \item{figure_id}{An integer representing the point number in figure 4 in
#'   \insertCite{Aeschbacher.2012;textual}{redoxpeat}.}
#'   \item{figure_label}{A character vector with the sample label used in
#'   figure 4 in \insertCite{Aeschbacher.2012;textual}{redoxpeat}.}
#'   \item{sample_type}{A character vector with the sample type (name and type
#'   of reference material).}
#'   \item{catalog_number}{A character vector with the IHSS catalog number for
#'   the HS, where available.}
#'   \item{comment}{A character vector with a comment how the EAC/EDC values
#'   were normalized.}
#' }
#' @source
#'      \insertCite{Aeschbacher.2012;textual}{redoxpeat}
#' @references
#'    \insertAllCited{}
"aeschbacher2012"

#' EAC and EDC values for various HS derived from \insertCite{Tan.2017;textual}{redoxpeat}.
#'
#' A dataset containing EAC and EDC values for several mineral soil HS as
#' derived from \insertCite{Tan.2017;textual}{redoxpeat}. Data were
#' derived from figure 2 in the publication using the R package
#' \insertCite{Poisot.2011}{redoxpeat}.
#'
#' @format A data frame with 27 rows and 4 variables:
#' \describe{
#'   \item{eac}{A numeric vector with the EAC [mmol/g].}
#'   \item{edc}{A numeric vector with the EAC [mmol/g].}
#'   \item{tmp_eac}{A numeric vector with x axis values (average annual
#'   temperature) in figure 2 for the EAC in
#'   \insertCite{Tan.2017;textual}{redoxpeat}.}
#'   \item{tmp_edc}{A numeric vector with x axis values (average annual
#'   temperature) in figure 2 for the EDC in
#'   \insertCite{Tan.2017;textual}{redoxpeat}.}
#' }
#' @source
#'      \insertCite{Tan.2017;textual}{redoxpeat}
#' @references
#'    \insertAllCited{}
"tan2017"


#' EAC and EDC values for various DOM samples derived from \insertCite{Walpen.2018;textual}{redoxpeat}.
#'
#' A dataset containing EAC and EDC values for several peat DOM samples as
#' derived from \insertCite{Walpen.2018;textual}{redoxpeat}. Data were
#' derived from figure 3 in the publication using the R package
#' \insertCite{Poisot.2011}{redoxpeat}.
#'
#' @format A data frame with 111 rows and 6 variables:
#' \describe{
#'   \item{eac_mean}{A numeric vector with the EAC [mmol/g\eqn{_\text{C}}].}
#'   \item{edc_mean}{A numeric vector with the EAC [mmol/g\eqn{_\text{C}}].}
#'   \item{suva}{A numeric vector with x axis values
#'   (SUVA\textsubscript{254} [L mg\eqn{_\text{C}^{-1}} m\eqn{^{-1}}]) in
#'   figure 3 for the EAC and EDC in
#'   \insertCite{Walpen.2018;textual}{redoxpeat}.}
#'   \item{y}{A numeric vector with y axis values (EAC and EDC
#'   [mmol/g\eqn{_\text{C}}]) in figure 3 for
#'   the EDC in \insertCite{Walpen.2018;textual}{redoxpeat}.}
#'   \item{sample_type}{A character vector representing the sample type
#'   (pore water or pool water).}
#'   \item{comment}{A character vector with a comment how the EAC/EDC values
#'   were normalized.}
#' }
#' @source
#'      \insertCite{Walpen.2018;textual}{redoxpeat}
#' @references
#'    \insertAllCited{}
"walpen2018"

#' Organic matter fraction regions in van-Krevelen diagrams derived from \insertCite{Kim.2003;textual}{redoxpeat}.
#'
#' A dataset containing data to create ellipses representing regions
#' characteristic for different organic matter fractions in van-Krevelen
#' diagrams as derived from \insertCite{Kim.2003;textual}{redoxpeat}. Data were
#' derived from figure 5 in the publication by estimating positions and angles
#' of ellipses by eye.
#'
#' @format A data frame with 5 rows and 6 variables:
#' \describe{
#'   \item{om_fraction}{A character with the name of the organic matter
#'   fraction.}
#'   \item{angle}{A numeric vector with the angle of the ellipse denoting the
#'   area of the OM fraction.}
#'   \item{O:C}{A numeric vector with the position of the ellipse denoting the
#'   area of the OM fraction along the O:C axis.}
#'   \item{H:C}{A numeric vector with the position of the ellipse denoting the
#'   area of the OM fraction along the H:C axis.}
#'   \item{oc_halfwidth}{A numeric vector with the half width of the ellipse
#'   denoting the area of the OM fraction along the O:C axis.}
#'   \item{hc_halfwidth}{A numeric vector with the half width of the ellipse
#'   denoting the area of the OM fraction along the H:C axis.}
#' }
#' @source
#'      \insertCite{Kim.2003;textual}{redoxpeat}
#' @references
#'    \insertAllCited{}
"van_krevelen_om"
