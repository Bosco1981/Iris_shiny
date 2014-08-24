library(shiny) 
library(ggplot2)
data(iris)
shinyUI(
        pageWithSidebar( 
                headerPanel("Iris Data Sets display"), 
                
                sidebarPanel(
                        selectInput("pair",
                                    label=h3("Display Pairs"),
                                    choices=list("Sepal.Length/Petal.Length"=1,
                                                 "Sepal.Length/Petal.Width"=2,
                                                 "Sepal.Width/Petal.Length"=3,
                                                 "Sepal.Width/Petal.Width"=4),
                                                 selected = 1
                                                 ),
                        h3("Species to show"),
                        checkboxInput("sp1", label = "setosa", value = TRUE),
                        checkboxInput("sp2", label = "versicolor", value = TRUE),
                        checkboxInput("sp3", label = "viriginica", value = TRUE),
                        sliderInput("sample", label = h3("Sample %"),
                                    min = 0, max = 100, value = 100),
                        helpText("Use the slider to choose a subsample of the",
                                 "dataset. 100% will display the whole dataset.")
                            ),
                
                mainPanel( 
                         plotOutput("plot")
                         ) 
        
        ))