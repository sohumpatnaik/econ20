#' Add together two numbers
#'
#' @param x A data frame with required data
#'
#' @param ticker A character with the desired ticker
#'
#' @return A ggplot object

make_plot <- function(x, ticker){

  x %>%
    filter(symbol == ticker) %>%
    arrange(v.date) %>%
    ggplot() + geom_point(aes(v.date, price.unadj)) +
    geom_point(aes(v.date, price)) -> p

  return(p)

}
