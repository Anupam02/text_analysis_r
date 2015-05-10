textfrequency <- function (text) {
  
  
  text.freqs <- table(text)
  
  sorted.text.freqs <- sort(text.freqs, decreasing=TRUE)
  if (length(unique(text)) >= 10) {
    return (sorted.text.freqs[1:10])
  }
  else {
    
    return (sorted.text.freqs)
  }
  
}