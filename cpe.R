#******************************************************************************#
#                                                                              #
#                          Lab 2 - CPE Standard                                #
#                                                                              #
#              Arnau Sangra Rocamora - Data Driven Securty                     #
#                                                                              #
#******************************************************************************#
if (!require("xml2")) install.packages("xml2") ; library(xml2)

compressed_cpes_url <- "https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.zip"
cpes_filename <- "cpes.zip"
download.file(compressed_cpes_url, cpes_filename)download.file(compressed_cpes_url, cpes_filename)
unzip(zipfile = cpes_filename)
cpe.file <- "./official-cpe-dictionary_v2.3.xml"

GetCPEItems <- function(cpe.raw) {
  cpes <- data.frame( name = xml2::xml_attr(xml2::xml_find_all(cpe.raw, "//d1:cpe-item"), "name"),
                     title = xml2::xml_text(xml2::xml_find_all(cpe.raw, "//d1:cpe-item/@title")),
                     cpe.23 = xml2::xml_text(xml2::xml_find_all(cpe.raw, "//cpe-23:cpe23-item/@name")),
                     stringsAsFactors = F)
  # return data frame

  return(cpes)

}

CleanCPEs <- function(cpes){

  # data manipulation

  return(cpes)
}

ParseCPEData <- function(cpe.file) {

  # load cpes as xml file
  cpes <- xml2::read_xml(x = cpe.file)

  # get CPEs
  cpes <- GetCPEItems(cpes)

  # transform, clean, arrange parsed cpes as data frame
  df <- CleanCPEs(cpes)

  # return data frame
  return(df)
}
