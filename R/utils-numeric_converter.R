#' Convert any potential numeric columns to numeric
#'
#' @param dt A tbl
#' @return A tbl
#'
numeric_converter <- function(dt){
  mutate_if(dt,
            ~ sum(is.na(.)) == sum(is.na(suppressWarnings(as.numeric(.)))), as.numeric)
}
