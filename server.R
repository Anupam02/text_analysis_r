source("extracttext.R")
source("extractfile.R")
source("textrelFreq.R")
source("file.R")
source("text.R")
shinyServer(
  function(input,  output) {
    user.data <- reactive({
      x <- if (length(input$file)==0){
        extractText(input$text,input$minwordlen,input$maxwordlen,input$stoplist)
      }
      #else if (is.null(input$file1))     return(NULL) 
      else {
        extractFile(input$file$name,input$minwordlen,input$maxwordlen,input$stoplist)
      }
      x
      })
    user.choice <- reactive({
      y <- if (input$var ==1){
        plot(textfrequency(user.data()),type="b",xlab="aaa",ylab="dddd",xaxt="n",col=input$color)
        axis(1,1:10,labels=names(textfrequency(user.data())[1:10]))
      pie(textfrequency(user.data()))}
      else if (input$var == 2){
        textrelfrequency
      }
      else {
        
      }
      y
    })
    #output$text1 <- renderText({paste(input$var,user.choice())})
    
    output$myhist <- renderPlot({
      #plot(user.choice()(user.data()),type="b",xlab="Top Ten words",ylab="frequency of top words",xaxt="n",col=input$color)
      user.choice()
      #axis(1,1:10,labels=names(user.choice()(user.data())[1:10]))
      
    })
    output$mypie <- renderPlot({  
      #pie(user.choice()(user.data()))
    }) 
    
    })

