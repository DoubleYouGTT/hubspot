#' Convert any potential epoch columns to datetimes
#'
#' @param dt A tbl
#' @return A tbl
#'
epoch_converter <- function(dt) {
  `.` <- NULL
  dt %>%
    mutate_at(
      vars(
        contains("timestamp"),
        contains("lastmodified")
      ),
      ~ ifelse(is.numeric(.),
        as.POSIXct(. / 1000, origin = "1970-01-01"),
        .
      )
    )
}
