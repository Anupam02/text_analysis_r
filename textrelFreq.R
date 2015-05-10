textrelfrequency <- function (text) {
  text.word.freqs <- table(text)
  sorted.word.freqs <- sort(text.word.freqs, decreasing=TRUE)
  
  sorted.word.rel.freqs <- 100*(sorted.word.freqs/sum(sorted.word.freqs))
  
  if (length(unique(text)) >= 10) {
    return (sorted.word.rel.freqs[1:10])
  }
  else {
    
    return (sorted.word.rel.freqs)
  }
  
}