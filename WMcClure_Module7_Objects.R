#Wayne McClure
# LIS43370 
#Module 7 S3 vs S4

#Find a dataset to use in R

data("trees")

##Base R functions that work with the Trees dataset
head(trees,6)
list(trees, 6)
show(trees)
mean(trees$Height)

### Finding type of OO system is employed we can use a library
library(pryr)
otype(trees)
ftype(mean)
ftype(show)

#Use an example of creating a class in S3 for the Trees data for how data will be stored and organized in 
## an S3 class of objects for storing "tree" data
trees_in_s3 = function(g, h, v) {
  tree = list(Girth = g, Height = h, Volume = v)
  class(tree) <- "trees_in_s3"
  tree
}


## Generic Function in S3 for Trees
meanofTrees <- function (trees ) {
  UseMethod("mean", x)
}



## Same class build to make a S4 function
setClass("trees_in_s4",
         representation(
           Girth="numeric",
           Height="numeric",
           Volume="numeric")
)



#use a similar function build in S4 build. A Show function is similar to that of Print()

setMethod("show", "trees_in_s4",
          function(object) {
            cat("Girth: ", object@Girth, "\n")
            cat("Height: ", object@Height, "\n")
            cat("Volume: ", object@Volume, "\n")
          }
)
