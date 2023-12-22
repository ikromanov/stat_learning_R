### 1. Basics ###
x <- c(1, 6, 2)
y = c(1, 4, 3)

length(x)
x + y

# remove objects
rm(x, y)

# rm all objects
rm(list = ls())

# HELP on matrix
?matrix

# create a matrix from a list
x <- matrix(data = c(1, 2, 3, 4), nrow = 2, ncol = 2)
# same as:  x <- matrix(c(1, 2, 3, 4), 2, 2)
matrix(c(1, 2, 3, 4), 2, 2, byrow = TRUE)

sqrt(x) # x^2

# random normal vars
set.seed(1303)
x <- rnorm(50)
y <- x + rnorm(50, mean = 50, sd = .1) 
cor(x, y)

### 2. Graphics ###
set.seed(3)
x <- rnorm(100)
y <- rnorm(100)
plot(x, y)
plot(x, y, xlab = "this is the x-axis",
       ylab = "this is the y-axis", main = "Plot of X vs Y")
pdf("Figure.pdf")
plot(x, y, col = "green")
dev.off()

# more interesting plot
x <- seq(1, 10)
y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
contour(x, y, f)
contour(x, y, f, nlevels = 45, add = T)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

# contour in color
image(x, y, fa)
# 3D
persp(x, y, fa)
persp(x, y, fa, theta=30)
persp(x, y, fa, theta=30, phi = 20)

### 3. Indexing ###
A <- matrix(1:16, 4, 4)
A
A[2, 3]
A[c(1, 3), c(2, 4)]
A[1:2, ]
A[-c(1,3), ]
dim(A)

### 4. Loading data ###
Auto <- read.table("./data/Auto.data", header = T, na.strings = "?", stringsAsFactors = T)
head(Auto)
dim(Auto)
names(Auto) # column names

### 5. Summaries ###
plot(Auto$cylinders, Auto$mpg)
attach(Auto) # load the namespace
plot(cylinders, mpg)

cylinders <- as.factor(cylinders)
plot(cylinders, mpg, col = "red", varwidth = T)
plot(cylinders, mpg, col = "red", varwidth = T, xlab = "cylinders", ylab = "MPG")

hist(mpg)
hist(mpg, col = 2, breaks = 15)
hist(mpg, col = 2)
attach(Auto)
pairs(Auto)
pairs(∼ mpg + displacement + horsepower + weight + acceleration, data = Auto)

plot(horsepower, mpg)
identify(horsepower, mpg, name)
summary(Auto)
