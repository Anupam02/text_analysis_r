extractText <- function (text, min.word.length, max.word.length,apply.stoplist) {
  
  text <- tolower(text)
  
  
  text <- strsplit(text,"\\W")
  
  text <- unlist(text)
  not.blanks <-which(text != "")
  text <- text[not.blanks]
  
  
  min.word.filter <- nchar(text) > min.word.length
  
  text <- text[min.word.filter]
  
  max.word.filter  <- nchar(text) < max.word.length
  
  text <- text[max.word.filter]
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
    words.without.stops <- lapply(text, mywhich, english.stoplist)
    return (unlist(words.without.stops))
  }
  else {
    return (text)
  }
}
  