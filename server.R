library(shiny) 
library(ggplot2)
data(iris)

shinyServer ( function(input, output) {
        output$plot<- renderPlot({
           
        datasample<- iris[c(sample.int(50,size=floor(input$sample/2)),
                              sample.int(50,size=floor(input$sample/2))+50,
                              sample.int(50,size=floor(input$sample/2))+100
                              ),]
        
        ind<-((datasample$Species=="setosa")&input$sp1)|((datasample$Species=="versicolor")&input$sp2)|((datasample$Species=="virginica")&input$sp3)
        datasample<-datasample[ind,]
        if (input$pair==1){
        qplot(Sepal.Length,Petal.Length,data=datasample,color=Species)}
        else {
                if (input$pair==2){
                        qplot(Sepal.Length,Petal.Width,
                              data=datasample,color=Species) 
                } else {
                        if (input$pair==3) {
                                qplot(Sepal.Width,Petal.Length,
                                      data=datasample,color=Species)
                        } else {
                                qplot(Sepal.Width,Petal.Width,
                                      data=datasample,color=Species)
                        }
                }
        }
       
        
        })
} )