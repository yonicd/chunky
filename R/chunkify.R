#' @title Wrap Script in Rmarkdown Chunk 
#' @description Inputs highlighted text in Rstudio document and wraps it in Rmarkdown Chunk
#' @return NOTHING
#' @details Use \code{\link{chunky_opts}} to set session parameters for addin
#' @rdname chunkify
#' @export 
#' @importFrom rstudioapi insertText getActiveDocumentContext setCursorPosition
chunkify <- function() {
  
  # Get document context
  # to get cursor position
  adc <- rstudioapi::getActiveDocumentContext()
  
  newend <- adc$selection[[1]]$range$start[[1]]+(adc$selection[[1]]$range$end[[1]]-adc$selection[[1]]$range$start[[1]])+3
  
  adc$selection[[1]]$range$start[[1]] <- adc$selection[[1]]$range$start[[1]]-1
  adc$selection[[1]]$range$end[[1]] <- newend
  adc$selection[[1]]$range$end[[2]] <- 1
  
  start_text <- "\n```{r"
  
  if(!chunky_opts$get('basic')){
    if(chunky_opts$get('counter')){
      chunky_num <- length(grep(sprintf('\\`\\`\\`\\{r %s',chunky_opts$get('name')),adc$contents[1:adc$selection[[1]]$range$start[[1]]])) + 1
      start_text <- paste(start_text,sprintf('%s%03d',chunky_opts$get('name'),chunky_num))      
    }else{
      start_text <- paste(start_text,chunky_opts$get('name'))
    }
      
  
  
  if(!is.null(chunky_opts$get('chunk_opts')))
    start_text <- paste(start_text,chunky_opts$get('chunk_opts'),sep=',')}
  
  start_text <- paste0(start_text,'}\n')
  
  # Insert text that splits the code chunk in two
  rstudioapi::insertText(location =  adc$selection[[1]]$range$start,start_text)
  rstudioapi::insertText(location =  adc$selection[[1]]$range$end,"\n```\n")

}