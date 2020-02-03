# Base R
setwd("C:/Users/Kim F/Desktop/Semester 1/R&SQL_for_Business_Analytics/3. Zusammenfassungen & Guidelines/1. Base R")
getwd()

library(tidyverse)

#CHT 2 in Kun Ren - Basic objects

# Vectors
# numeric vectors
1.5
x <- 1.5
x
numeric(10)
c(1, 2, 3, 4, 5)
c(1, 2, c(3, 4, 5))
1:5
seq(1, 3, by = 0.2)
seq(3, length.out = 10)
rep(1, 3)
1 + 1:5
1- 1:5
x <- 2*c(a= 1,2,3)
x
xrep("a", 5)
a:b
TRUE
1 > 2
c(1, 2) > 2
c(1, 2) > c(2, 1)
c(2, 3) > c(1, 2, -1, 3)
1 == c(1,2,5)
1 %in% c(1, 2, 3)
1 != c(1, 2, 3)
c(1, 4) %in% c(1, 2, 3)
# character vectors

"hello, world!"
'Hello, World!'
c("Hello,", "World")
c("Hello", "World") == c('Hello', 'World')
c("Hello", "World") == c("World", "Hello")
c("Hello", "World") %in% c("World", "Hello")
c("Hello,", "World") == "Hello, World"

# cat Function w/ character vectors
cat("Hello\nWorld")
cat("Is \"You\" a Chinese name?")
cat("Is 'You' a Chinese name?")
cat("Hello \"World\" ")
cat("Is \\You\\ a Chinese name?")

# subsetting vectors

v1 <- c(1, 2, 5, 4)
v1[2]
v2 <- c(20, 29, 41, 64)
v2[4]

v2[2:4]
v2[-3]

a <- c(1, 3)
v1[a]
v1[c(1, 2, -3)] #Error
v1[c(1, 2, 3)]

v1[3:6]
v1[c(TRUE, FALSE, TRUE, FALSE)]

#reassign values to a given vector
v1 <- c(1, 2, 3, 4)
v1[2] <- 0
v1
v1[2:4] <- c(0, 1, 3)
v1
v1[c(TRUE, FALSE, TRUE, FALSE)] <- c(3, 2)
v1
v1[v1 <= 2] 
v1
v1[v1 ^ 2 - v1 + 1 >= 0] 
v1[v1 <= 2] <- 0
v1

v1[10] <- 8

#names in vectors
x <- c(a = 1, b = 2, c = 3)
x

x["a"]
x[c("a", "c")]
x[c("a", "a", "c")]


names(x)


names(x) <- c("x", "y", "z")
x["z"]

#removing names
names(x) <- NULL
x

x <- c(a = 1, b = 2, c = 3)
x["a"]

names(x["d"])
x[c("a", "d")]
x <- c(1,2,1,3)
sort(x)
?which

# [] creates a subset of a vector 
# [[]] extracts an element from a vector 
x <- c(a = 1, b = 2, c = 3)
x["a"]
x[["a"]]

#Error - can only select one element:
x[[c(1, 2)]]
x[[-1]]

#Doesn't exist
x[["d"]]

# checking anc coercing classes of a vector

class(c(1, 2, 3))
class(c(TRUE, TRUE, FALSE))
class(c("Hello", "World"))


is.numeric(c(1, 2, 3))
is.numeric(c(TRUE, TRUE, FALSE))
is.numeric(c("Hello", "World"))

strings <- c("1", "2", "3")
class(strings)

strings + 10

numbers <- as.numeric(strings)
numbers
class(numbers)

numbers + 10

showMethods(coerce)

as.numeric(c("1", "2", "3", "a"))
as.logical(c(-1, 0, 1, 2))
as.character(c(1, 2, 3))
as.character(c(TRUE, FALSE))


as.character(c(1, 2)) + c(2, 3)


c(1, 2, 3, 4) + 2
c(1, 2, 3) - c(2, 3, 4)
c(1, 2, 3) * c(2, 3, 4)
c(1, 2, 3) / c(2, 3, 4)
c(1, 2, 3) ^ 2
c(1, 2, 3) ^ c(2, 3, 4)

#modular arithmetic
c(1, 2, 3, 14) %% 2
c(1, 2, 3, 14) %/% 2

# arithmetic operations with name attributes
c(a = 1, b = 2, c = 3) + c(b = 2, c = 3, d = 4)
c(a = 1, b = 2, 3) + c(b = 2, c = 3, d = 4)


#matrices
matrix(c(1, 2, 3, 2, 3, 4, 3, 4, 5), ncol = 3)

matrix(c(1, 2, 3, 
         4, 5, 6, 
         7, 8, 9), nrow = 3, byrow = FALSE)

matrix(c(1, 2, 3, 
         4, 5, 6, 
         7, 8, 9), nrow = 3, byrow = TRUE)

diag(1, nrow = 5, ncol =5)

matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE,
       dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))

m1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3)
rownames(m1) <- c("r1", "r2", "r3")
colnames(m1) <- c("c1", "c2", "c3")
m1

# subsetting matrices
m1[1, 2]
m1[1:2, 2:3]
m1[1,]
m1[,2]
m1[1:2,]
m1[, 2:3]

m1[-1,]
m1[,-2]

m1[c("r1", "r3"), c("c1", "c3")]

#If you don't specify rows and columns, the matrix is regarded as a vector - well, 
#it is in fact always a vector (at least in R)!
m1[1]
m1[9]
m1[3:7]

m1 > 3
m1[m1 > 3]

# arithmetic operations with matrices
m1 + m1
m1 - 2*m1
m1 * m1
m1 / m1
m1 ^ 2
m1 %*% m1

# other formulas matrices
t(m1)
m1
nrow(m1)

#arrays
a1 <- array(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), dim = c(1, 5, 2))
a1

#more complicated...
a1i <- seq(1:60)
a1ii <- array(a1i, dim = c(2, 5, 2, 3))
a1ii

(a1 <- array(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), dim = c(1, 5, 2),
            dimnames = list(c("r1"), c("c1", "c2", "c3", "c4", "c5"), c("k1", "k2"))))
a1

a0 <- array(c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), dim = c(1, 5, 2))
dimnames(a0) <- list(c("r1"), c("c1", "c2", "c3", "c4", "c5"), c("k1", "k2"))
a0

# subsetting arrays
a1[1,,]
(a2 <- a1[,2,])
is.vector(a2)
a1[,,1]
a1[1, 1, 1]
a1[1, 2:4, 1:2]
is.vector(a3)
a1[c("r1"), c("c1", "c3")]
a1[8:9]
a1[a1>3]

#lists
l0 <- list(1, c(TRUE, FALSE), c("a", "b", "c"))
l0

l1 <- list(x = 1, y = c(TRUE, FALSE), z = c("a", "b", "c"))
l1

# subsetting lists
l1$x
l1$y
l1$z
l1$m

l1[[2]]
l1[["y"]]

member <- "z" # you can dynamically determine which member to extract
l1[[member]]

l1["x"]
l1[c("x", "y")]
l1[1]
l1[c(1, 2)]
l1[c(TRUE, FALSE, TRUE)]

# assigning names to list elements

names(l1) <- c("A","B","C")
l1

names(l1) <- NULL
l1

# change values 
l1 <- list(x = 1, y = c(TRUE, FALSE), z = c("a", "b", "c"))
l1$x <- 0
l1

#adding element to l1
l1$m <- 4
l1


l1[c("y", "z")] <- list("new value for y", c(1, 2))
l1

l1$x <- NULL
l1


l1[c("z", "m")] <- NULL
l1


l2 <- list(a = c(1, 2, 3), b = c("x", "y", "z", "w"))
is.list(l2)
is.list(l2$a)
is.vector(l2$a)

l3_v <- c(a = 1, b = 2, c = 3)
l3_v
l3 <- as.list(c(a = 1, b = 2, c = 3))
l3

l4 <- list(a = 1, b = 2, c = 3)
l4
unlist(l4)


l4 <- list(a = 1, b = 2, c = "hello")
l4
unlist(l4)


#data frames
persons <- data.frame(Name = c("Ken", "Ashley", "Jennifer"),
                      Gender = c("Male", "Female", "Female"),
                      Age = c(24, 25, 23),
                      Major = c("Finance", "Statistics", "Computer Science"))
persons


l1 <- list(x = c(1, 2, 3), y = c("a", "b", "c"))
l1
#creating a data frame from a list
data.frame(l1)
#or
as.data.frame(l1)

# use do.call and rbind: with both of these functions one can create a matrix from a list
# and the coerce the latter to a data frame
#gathering
students <- strsplit(c("Tony, 26, Physics", "James, 25, Economics", "Kim, 26, BI"), split = ", ") 
# creates list
students
students_matrix <- do.call(rbind, students) # creates a matrix
colnames(students_matrix) <- c("name", "age", "major")
students_matrix
class(students_matrix)
students_matrix[, 2]
x <- data.frame(students_matrix, stringsAsFactors = FALSE)
class(x)
x$age
x$age <- as.numeric(x$age)
x$age
str(x)
# add a row to data frame with do call and rbind
# 1. create a vector with information to add
y <- c("Paul", "28", "Biology")
# 2. create a list of vector and data frame 
list <- list(x,y)
list
# 3. do call and rbind
do.call(rbind, list)
#from a matrix
m1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = FALSE)
m1
class(m1)
data.frame(m1)
as.data.frame(m1)
class(as.data.frame(m1))

df1 <- data.frame(id= 1:5, x = c(0, 2, 1, -1, -3), y = c(0.5, 0.2, 0.1, 0.5, 0.9))
df1
df1 <- data.frame(id1 = 1:5, id2= c(0, 2, 1, -1, -3), id3= c(0.5, 0.2, 0.1, 0.5, 0.9))
df1
colnames(df1) <- c("id", "level", "score")
rownames(df1) <- letters[1:5]
df1$third <- c(2:6)
df1$proportion <- df1$id/sum(df1$id)
df1

# subsetting a data frame

df1$id
df1[[1]]


(df2 <-  df1[1])
is.data.frame(df2)
is.matrix(df2)
df1[1:2]
df1["level"]
df1[c("id", "score")]
df1[c(TRUE, FALSE, TRUE)]


(df2 <- df1[, "level"])
is.matrix(df2)
is.vector(df2)
df1[c("a", "c"), c("id", "level")]
df1[, 1:2]


df1[1:4,]
df1[c("c", "e"),]


df1[1:4, "id"]
df1[1:3, c("id", "score")]


#becomes a vector
(x <- df1[1:4, "id"])
class(x)

#still a data frame
(x <- df1[1:4,]["id"])
class(x)
#or
x <- df1[1:4, "id", drop = FALSE]
class(x)

#filtering
df1
df1$score >= 0.5
df1[df1$score >= 0.5, c("id", "level")]

df1
rownames(df1) %in% c("a", "d", "e")
df1[rownames(df1) %in% c("a", "d", "e"), c("id", "score")]


df1$score <- c(0.6, 0.3, 0.2, 0.4, 0.8)
df1


#Setting values as a list
df1["score"] <- c(0.8, 0.5, 0.2, 0.4, 0.8)
df1
df1[["score"]] <- c(0.4, 0.5, 0.2, 0.8, 0.4)
df1
#use only one set of [] if multiple columns have to be modified
df1[c("level", "score")] <- list(level = c(1, 2, 1, 0, 0), score = c(0.1, 0.2, 0.3, 0.4, 0.5))
df1

#Setting values as a matrix
df1[1:3, "level"] <- c(-1, 0, 1)
df1
df1[1:2, c("level", "score")] <- list(level = c(0, 0), score = c(0.9, 1.0))
df1


#factors
str(persons)
persons[1, "Name"] <- "John"
persons

persons <- data.frame(Name = c("Ken", "Ashley", "Jennifer"),
                      Gender = factor(c("Male", "Female", "Female")),
                      Age = c(24, 25, 23),
                      Major = c("Finance", "Statistics", "Computer Science"),
                      stringsAsFactors = FALSE)
str(persons)



#useful functions for data frames

summary(persons)
#append rows:
(persons <- rbind(persons, data.frame(Name = "John", Gender = "Male", Age = 25, Major = "Statistics")))
#append columns:
persons <- cbind(persons, Registered = c(TRUE, TRUE, FALSE), Projects = c(3, 2, 3))
persons

#all combinations of type and class

(grid1 <- expand.grid(type = c("A", "B"), class = c("M", "L", "XL")))



#CSV read/write
read.csv("data/persons.csv")

write.csv(persons, file = "persons.csv", row.names = FALSE, quote = FALSE)


#functions
add <- function(x, y) {
  x + y
}

add(2, 3)
add(c(2, 3), 4)

add(as.Date("2014-06-01"), 1)
add(list(a = 1), list(a = 2))

calc <- function(x, y, type) {
  if (type == "add") {
    x + y
  } else if (type == "minus") {
    x - y
  } else if (type == "multiply") {
    x * y
  } else if (type == "divide") {
    x / y
  } else {
    stop("Unknown type of operation")
  }
}

calc(2, 3, "minus")
calc(c(2, 5), c(3, 6), "divide")
calc(as.Date("2014-06-01"), 3, "add")
calc(1, 2, "what")
calc(1, 2, c("add", "minue"))


calc <- function(x, y, type) {
  if (length(type) > 1L) stop("Only a single type is accepted")
  if (type == "add") {
    x + y
  } else if (type == "minus") {
    x - y
  } else if (type == "multiply") {
    x*y
  } else if (type == "divide") {
    x / y
  } else {
    stop("Unknown type of operation")
  }
}

calc(1, 2, c("add", "minus"))


increase <- function(x, y = 1) {
  x + y
}
increase(1)
increase(c(1, 2, 3))


