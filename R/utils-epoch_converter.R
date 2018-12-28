#' Convert any potential epoch columns to datetimes
#'
#' @param dt A tbl
#' @return A tbl
#'
epoch_converter <- function(dt) {
  as_data_frame(
    lapply(dt, function(x) {
      if (is.factor(x) | is.character(x) | is.list(x)) {
        x
      } else if (suppressWarnings(min(x, na.rm = TRUE)) > 1e+10) {
        as.POSIXct(x / 1000, origin = "1970-01-01")
      } else {
        x
      }
    })
  )
}
