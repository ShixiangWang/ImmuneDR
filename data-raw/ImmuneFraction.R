## ImmuneFraction is a data base, its metadata is stored in
## data/ and lasily loaded by R
## All data tables should be stored in inst/extdata/

database = data.table::fread("data-raw/TCGA.Kallisto.fullIDs.cibersort.relative.tsv.gz")

usethis::use_data("ImmuneFraction")
