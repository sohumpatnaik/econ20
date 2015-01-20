#' Gather data needed for project
#' 
#' @param tickers character vector of tickers to gather. Default is NULL,
#'   meaning use all companies.
#'   
#' @return A data frame of required data.

gather_data <- function(tickers = NULL){

  ## Bringing all the data I need together.

  library(ws.data)

  data(daily.1998)
  data(yearly)
  data(secref)
  
  if(! is.null(tickers)){
    x <- filter(daily.1998, symbol %in% tickers)
  } else{
    x <- tbl_df(daily.1998)
  }
  

  x <- left_join(x, secref, by = c("id", "symbol"))

  y <- filter(yearly, year == 1998)

  x <- left_join(x, y, by = c("id", "symbol"))

  x <- tbl_df(x)

  x <- filter(x, top.1500)

  ## Clean up bad data items

  x <- filter(x, ! symbol %in% c("CHTM", "3STTCE"))


}
