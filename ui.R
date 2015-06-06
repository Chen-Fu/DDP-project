# ui.R

shinyUI(fluidPage(
   titlePanel("Intuitive Verification of Central Limit Theorem"),
   
   sidebarLayout(
      sidebarPanel(
         helpText("This app helps you understand Central Limit Theorem (CLT)
                  intuitively. CLT tells us that the distribution of the sample means 
                  has an approximate normal distribution, no matter what the distribution 
                  of the original data looks like, as long as the sample size is large enough."),
         
         selectInput("distribution_type", 
                     label = "Sample from:",
                     choices = c("Poisson distribution with lambda 1", 
                                 "Exponential distribution with lambda 1",
                                 "Standard uniform distribution"),
                     selected = "Poisson Distribution"),
                  
      sidebarPanel(
         sliderInput("Sample_size",
                     "Sample size for each trial:",
                     min = 1,
                     max = 30,
                     value = 1)
      )
         
         
      ),
      
      mainPanel(
         plotOutput("distPlot")
      )
   )
))