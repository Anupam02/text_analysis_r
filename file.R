filefrequency <- function(file, min.word.length,max.word.length) {
  file.content <- scan(file,what="character",sep="\n")
  file.content <- paste(file.content,collapse=" ")
  file.content <- tolower(file.content)
  file.content.words <- strsplit(file.content,"\\W")
  file.content.word.vector <- unlist(file.content.words)
  not.blanks <- which(moby.word.vector!="")
  file.content.word.vector <- file.content.word.vector[not.blanks]
  word.freqs <- table(file.content.word.vector)
  sorted.word.freqs <- sort(word.freqs, decreasing=TRUE)
  
  sorted.word.rel.freqs <- 100*(sorted.word.freqs/sum(sorted.word.freqs))
  
  if (lenght(unique(file.content.word.vector))>10) {
    return(sorted.word.freqs[1:10])
    
  }
  else {
    return(sorted.word.rel.freqs)
  }
  
  print (head(file.content.words))
}