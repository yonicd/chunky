#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname chunkify
#' @export 
#' @importFrom rstudioapi insertText getActiveDocumentContext setCursorPosition
chunkify <- function() {
  
  # Get document context
  # to get cursor position
  adc <- rstudioapi::getActiveDocumentContext()
  
  newend <- adc$selection[[1]]$range$start[[1]]+(adc$selection[[1]]$range$end[[1]]-adc$selection[[1]]$range$start[[1]])+2
  
  adc$selection[[1]]$range$start[[1]] <- adc$selection[[1]]$range$start[[1]]-1
  adc$selection[[1]]$range$end[[1]] <- newend
  adc$selection[[1]]$range$end[[2]] <- 1
  
  # Insert text that splits the code chunk in two
  rstudioapi::insertText(location =  adc$selection[[1]]$range$start,"\n```{r}")
  rstudioapi::insertText(location =  adc$selection[[1]]$range$end,"```\n")

}

#' @export
chunkify_time <- function(date=Sys.time()) {
  
  # Get document context
  # to get cursor position
  adc <- rstudioapi::getActiveDocumentContext()
  
  newend <- adc$selection[[1]]$range$start[[1]]+(adc$selection[[1]]$range$end[[1]]-adc$selection[[1]]$range$start[[1]])+2
  
  adc$selection[[1]]$range$start[[1]] <- adc$selection[[1]]$range$start[[1]]-1
  adc$selection[[1]]$range$end[[1]] <- newend
  adc$selection[[1]]$range$end[[2]] <- 1
  
  # Insert text that splits the code chunk in two
  rstudioapi::insertText(location =  adc$selection[[1]]$range$start,sprintf("\n```{r %s}",date))
  rstudioapi::insertText(location =  adc$selection[[1]]$range$end,"```\n")

}