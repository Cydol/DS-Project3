# Map 1-based optional input ports to variables
dataset1 <- maml.mapInputPort(1) # class: data.frame

# Function for Conditioned Scatter Plot
scatter.delay = function(x) {
  library(ggplot2)
  library(gridExtra)
  
  options(repr.plot.width=6, repr.plot.height=3)
  
  title = paste("ArrDelay vs.", x, "with color by ArrDel15")
  
  ggplot(dataset1, aes_string(x, "ArrDelay")) +
    geom_point(aes(color = factor(ArrDel15))) +
    ggtitle(title) +
    theme_bw()
}

# Define columns for making scatter plot
plot.cols3 = c("DepDelay", "CRSArrTime", "CRSDepTime", "DayofMonth", "DayOfWeek", "Month")

lapply(plot.cols3, scatter.delay)

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("dataset1");