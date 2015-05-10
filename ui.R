shinyUI(fluidPage(
  titlePanel("text analysis"),
  
  
  
  
  sidebarLayout(
    
    sidebarPanel(
      
      
      textInput("text", "Text input", 
                value = "Enter text...") ,
    
      fileInput("file","File input"),
      
      sliderInput("minwordlen", "minimum word length",
                  min = 0, max = 10, value = 3),
      sliderInput("maxwordlen", "maximum word length",
                  min = 0, max = 15, value = 8),
      selectInput("var","Select the attribute of interest",choices=c("word frequency"=1,
                  "relative frequency"=2,"topic modelling"=3)),
      radioButtons("stoplist","stoplist option",choices=c("apply stoplist","donot apply stoplist"),selected="donot apply stoplist"),
      radioButtons("color","Select the color for the histogram",
                   choices = c("Green","Red","Blue"),selected="Green")
            
      
      
    ),
    
    mainPanel(
      textOutput("text1"),
      plotOutput(outputId="myhist",width="100%"),
      plotOutput(outputId="mypie",width="100%")
      
    )
  
)))

