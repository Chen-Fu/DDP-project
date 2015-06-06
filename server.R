# server.R

shinyServer(
   function(input, output) {   
      
      output$distPlot <- renderPlot({
         # set seed is for reproducibility
         set.seed(1)
         
         if (input$distribution_type == "Poisson distribution with lambda 1"){
            
            sample <- NULL
            # We construct 1000 trials for each sample size
            for (i in 1 : 1000){
               sample <- cbind(sample,rpois(n = input$Sample_size, lambda = 1))
            }
            sample <- as.data.frame(sample)
            trial_mean <- sapply(sample, mean)    
            # Theoretical value of mean and variance of Poisson distribution
            mu <- 1
            sigma <- 1
            # Centralizing the data
            central_pois <- (trial_mean - mu)/(sigma/sqrt(input$Sample_size))
            names(central_pois) <- NULL
            ## Draw the histogram
            hist(central_pois,freq = FALSE, 
                 main = paste("Hist of 1000 trials of (X_1+X_2+...X_n)/n, n = ",input$Sample_size)
                 ,xlab = "Value of each specific trial") 
            
         }else if (input$distribution_type == "Standard uniform distribution"){
            
            sample <- NULL
            # We construct 1000 trials for each sample size
            for (i in 1 : 1000){
               sample <- cbind(sample,runif(n = input$Sample_size))
            }
            sample <- as.data.frame(sample)
            trial_mean <- sapply(sample, mean)    
            # Theoretical value of mean and variance of Uniform distribution
            mu <- 0.5
            sigma <- 1/sqrt(12)
            # Centralizing the data
            central_unif <- (trial_mean - mu)/(sigma/sqrt(input$Sample_size))
            names(central_unif) <- NULL
            ## Draw the histogram
            hist(central_unif,freq = FALSE, 
                 main = paste("Hist of 1000 trials of (X_1+X_2+...X_n)/n, n = ",input$Sample_size)
                 ,xlab = "Value of each specific trial") 
            
         }else if (input$distribution_type == "Exponential distribution with lambda 1"){
            
            sample <- NULL
            # We construct 1000 trials for each sample size
            for (i in 1 : 1000){
               sample <- cbind(sample,rexp(n = input$Sample_size, rate = 1))
            }
            sample <- as.data.frame(sample)
            trial_mean <- sapply(sample, mean)    
            # Theoretical value of mean and variance of Poisson distribution
            mu <- 1
            sigma <- 1
            # Centralizing the data
            central_exp <- (trial_mean - mu)/(sigma/sqrt(input$Sample_size))
            names(central_exp) <- NULL
            ## Draw the histogram
            hist(central_exp,freq = FALSE, 
                 main = paste("Hist of 1000 trials of (X_1+X_2+...X_n)/n, n = ",input$Sample_size)
                 ,xlab = "Value of each specific trial") 
            
         }else{  
         }
 
         # Draw a standard normal distribustion curve 
         partition <- seq(from = -3, to = 3, by = 0.01) 
         lines(partition,dnorm(partition),col = "red", lwd = 2)
      
      })
      
   }
)
