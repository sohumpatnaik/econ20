#' Gather data needed for project
#' 
#' @param tickers character vector of tickers to gather. Default is NULL,
#'   meaning use all companies.
#'   
#' @param years numeric vector like 1999:2000 of years to gather
#' 
#' @return A data frame of required data.
#' 

old_grab_data <- function(symbols, years){

  ## all calculations are done using the ws.data package
  ## loads the package if it is not loaded already
  
  require(ws.data)
  
  ##initialize an empty data.frame
  
  grabbed <- data.frame()
  
  for( i in years ){
    
    ## iterate through each year in the year array,
    ## getting the subset of each year that contains symbols
    
    file.name <- paste("daily", i, sep = ".")
    data(list = file.name)
    
    ##combine all the data by rows
    
    grabbed <- rbind(grabbed, subset(eval(parse(text=file.name)), symbol %in% symbols))
    
  }
  
  ##return the desired data.frame, but do not print it
  
  invisible(grabbed)
  
}
