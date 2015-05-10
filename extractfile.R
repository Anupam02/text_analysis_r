extractFile <- function(file, min.word.length,max.word.length,apply.stoplist) {
  file.content <- scan(file,what="character",sep="\n")
  file.content <- paste(file.content,collapse=" ")
  file.content <- tolower(file.content)
  file.content.words <- strsplit(file.content,"\\W")
  file.content.word.vector <- unlist(file.content.words)
  not.blanks <- which(file.content.word.vector!="")
  file.content.word.vector <- file.content.word.vector[not.blanks]
  min.word.filter <- nchar(file.content.word.vector) > min.word.length
  
  file.content.word.vector <- file.content.word.vector[min.word.filter]
  
  max.word.filter  <- nchar(file.content.word.vector) < max.word.length
  
  file.content.word.vector <- file.content.word.vector[max.word.filter]
  if (apply.stoplist=="apply stoplist") {
    english.stoplist <- scan("jockersStopList.txt", 
                             what = "character")
    aa <- strsplit(english.stoplist, ",")
    # english.stoplist<-unique(english.stoplist[,1])
    english.stoplist <- sapply(X = aa, FUN = function(x) {
      x[[1]]
    })
    length(english.stoplist)
    mywhich <- function(word.vector, stoplist) {
      word.vector[!(word.vector %in% stoplist)]
    }
    words.without.stops <- lapply(file.content.word.vector, mywhich, english.stoplist)
    return (unlist(words.without.stops))
  }
  else {
    return (file.content.word.vector)
  }

}