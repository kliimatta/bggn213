#' ---
#' title: "Week 4 Data visualization lab"
#' author: "Kalle Liimatta (PID A59002114)"
#' date: "October 12, 2022"
#' ---


# Week 4 Data visualization lab

View(cars)

#Simple base R plot
plot(cars)

#One-time only install
#install.packages("ggplot2")

#Everytime you want to use a package in a 
#new session, you have to load it with:
library(ggplot2)

#Our first ggplot:
#We need data + aes + geom
p <- ggplot(cars) +
  aes(x=speed, y=dist) +
  geom_point()

#A silly line and point plot
p + geom_line()

#Add a fitted line
p + geom_smooth()

#Fit a linear model
p + geom_smooth(method="lm")

p + geom_smooth(method="lm") +
  labs(title="Speed and Stopping Distances of Cars",
     x="Speed (MPH)", 
     y="Stopping Distance (ft)",
     subtitle = "Vroomin' and Zoomin'",
     caption="Dataset: 'cars'") +
  theme_bw()

#Example plot from data2viz website

ggplot(iris, aes(x=Sepal.Length, 
                 y=Sepal.Width, 
                 col=Species)) +
  geom_point()


#Make a more bioinformatic style plot
#RNAseq dataset for drug vs no drug treatment
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
  
#look at first 6 genes
View(genes)

#Q. how many genes are in this dataset
nrow(genes)

colnames(genes)
ncol(genes)
#Q. how many upregulated genes are there
table(genes$State)

#Q. What fraction of genes are up/down/etc.
round((table(genes$State)/nrow(genes))*100, 2)

#Generate a publication figure
g <- ggplot(genes) +
    aes(x=Condition1,
        y=Condition2,
        col=State) +
    geom_point()

#Add more custom layers
g + theme_bw() + 
  scale_color_manual(values=c("blue", "gray", "red")) +
  labs(x="Conrtol (no drug)",
       y="Drug treated",
       title="Gene expression changes example plot")