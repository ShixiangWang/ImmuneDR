# Class for storing data
DataTable = function(
    data,
    Attribution
) {
    stopifnot(is.data.frame(data), is.data.frame(Attribution))
    dt = list(
        data = ifelse(inherits(data, "data.table"), data,
                      data.table::as.data.table(data, keep.rownames = "rowname")),
        Attribution = Attribution
    )

    class(dt) = "DataTable"
    return(dt)
}

Attribution = function(
    Source,
    Software,
    MaintainerName,
    MaintainerEmail,
    Description = "",
    Unit = "",
    Citation = "",
    Note = "",
    LastModified = Sys.time()
) {
    stopifnot(
        !is.na(Source) & !is.null(Source),
        !is.na(Software) & !is.null(Software),
        !is.na(MaintainerName) & !is.null(MaintainerName),
        !is.na(MaintainerEmail) & !is.null(MaintainerEmail),
        !is.na(Description) & !is.null(Description),
        !is.na(Unit) & !is.null(Unit),
        !is.na(Citation) & !is.null(Citation),
        !is.na(Note) & !is.null(Note),
        !is.na(LastModified) & !is.null(LastModified)
    )
    dt = dplyr::tibble(
        Name = c("Source", "Software", "Description", "Unit",
                 "Note", "Citation", "MaintainerName", "MaintainerEmail", "LastModified"),
        Description = c(Source, Software, Description, Unit,
                        Note, Citation, MaintainerName, MaintainerEmail, LastModified %>% as.character())
    )

    dt = dt %>% data.table::as.data.table()
    class(dt) = c("Attribution", class(dt))
    dt
}
