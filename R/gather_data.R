#' Gather data needed for project
#'
#' @return A data frame of required data.

gather_data <- function(){

  ## Bringing all the data I need together.

  library(ws.data)

  data(daily.1998)
  data(yearly)
  data(secref)

  x <- left_join(daily.1998, secref, by = c("id", "symbol"))

  y <- filter(yearly, year == 1998)

  x <- left_join(x, y, by = c("id", "symbol"))

  x <- tbl_df(x)

  x <- filter(x, top.1500)

  ## Clean up bad data items

  x <- filter(x, ! symbol %in% c("CHTM", "3STTCE"))


}
