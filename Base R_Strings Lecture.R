# Base R - Strings
setwd("C:/Users/Kim F/Desktop/Semester 1/R&SQL_for_Business_Analytics/3. Zusammenfassungen & Guidelines/1. Base R")
library(tidyverse)
library(stringr)
library(plyr)
# Lecture Session 5 
"Hello"
x <- "Hello"
x
class(x)
#Explicitly print an object: use print
for(i in 1:3) {x}
for(i in 1:3) {print(x)}

#Use cat () or message() if texts should be a message rather than a character vector.

name <- "Ken"
language <- "R"
cat("Hello, ", name, ", a user of ", language, ".")
cat("Hello, ", name, ", a user of ", language, ".", sep = "")
message("Hello, ", name,", a user of ", language, ".") 
#red output and sep = "" not needed

#Another difference:
for(i in 1:3) {
  cat(letters[[i]])
}
for(i in 1:3) {
  message(letters[[i]]) #message() appends a new line to the input string.
}
#Similar to (except for the red colour):
for(i in 1:3) {
  cat(letters[[i]], "\n", sep = "")
}


#Concatenating strings - paste()
paste("Hello", "world") #from two strings to one string
paste("Hello", "world", sep="-")
paste("Hello", "world", sep="")
paste0("Hello", "world") # same as paste("Hello", "world", sep="")

# cat() vs. paste()
#cat() only prints the string to the console, whereas paste() returns a sting for further uses
x <- cat("Hello", "world")
y <- paste("Hello", "world")
x
y

#paste() works element-wise
paste(c("A", "B"), c("C", "D"))
paste(c("A", "B"), c("C", "D"), collapse = " ") #concatenated
paste(c("A", "B"), c("C", "D"), collapse = ";")
paste(c("A", "B"), c("C", "D"), collapse = "\"")
d <- paste(c("A", "B"), c("C", "D"), collapse = "\"")
cat(d)
result <- paste(c("A", "B"), c("C", "D"), collapse = "\n")
result
#The new character vector "result" is a two-lined string, but the text representation of it is
#still written in one line. The new line is representated by \n as specified. To view the text
#we need to call cat() or WriteLines()
cat(result)
writeLines(result)


#Transformation of text: tolower() and toupper()
tolower("Hello")
toupper("Hello")
#The two functions are vectorized:
toupper(c("Hello", "world"))
tolower(c("HELLO", "WORLD"))


#Counting the number of characters (of each element of a character vector): nchar()
nchar("Hello")
nchar(c("Hello", "World", "of", "R", "Users")) #function is also vectorized
length("Hello") #length of the vector is one, 1 element
length(c("Hello", "World", "of", "R", "Users")) 
#the length of the vector is five, 5 elements


#Trimming leading and trailing whitespaces: trimws()
trimws(c("  Hello World  ")) 
trimws(c("  Hello World  "), "left") 
trimws(c("  Hello World  "), "right") 
nchar(" P")
x <- trimws(c("     Hello World ")) #tabs
x
cat(x)
writeLines(x)

#subsetting character vectors: substr()
dates <- c("Jan 3", "Feb 10", "Nov 15")
substr(dates, 1, 3)
substr(dates, 5, 5)
substr(dates, 5, nchar(dates))


dates <- c("Jan 3", "Feb 10", "Nov 15")
dates

# overwrite with substr()
substr(dates, 1, 3) <- c("Feb", "Dec", "Mar") 
dates
#replace the first 3 characters with c(.)

?strsplit
#Splitting text and make each each part accessible: strsplit() 
#returns a list (of vectors)
strsplit("a,bb,ccc", split = "") 
strsplit("a, bb, ccc", split = "")  
students <- strsplit(c("Tony, 26, Physics", "James, 25, Economics", "Kim, 26, BI"), split = ", ")
students

dates <- c("Jan 3", "Feb 10", "Nov 15")
dates <- strsplit(dates, split = " ") # returns a list
dates
dates <- as.data.frame(dates, stringsAsfactors = FALSE)
dates
rownames(dates) <- NULL
colnames(dates) <- NULL
dates
dates <- t(dates)
dates <- as.data.frame(dates, stringsAsfactors = FALSE)
is.data.frame(dates)
dates
colnames(dates) <- c("month", "day")
dates
str(dates)
dates[[2]] <- as.numeric(as.character(dates[[2]]))
dates
dates[[1]] <- as.character(dates[[1]])
dates

# alternative: list into df with ldply() from plyr package

?ldply
dates <- c("Jan 3", "Feb 10", "Nov 15")
dates <- strsplit(dates, split = " ")
dates
dates <- ldply(dates)
dates
colnames(dates) <- c("month", "day")
str(dates)
dates[[2]] <- as.numeric(dates[[2]])
str(dates)

#Formatting texts - sprintf

cat(sprintf("#%d, name: %s, age: %d, major: %s", 1:nrow(x), x$name, x$age, x$major), sep = "\n")


# %d and %s are placeholders to represent the input arguments to appear in the string
# %s stands for string and %d stands for digits (integers) 

?sprintf
sprintf("The length of the line is approximately %.1fmm", 12.295) #round the number to 0.1
sprintf("The length of the line is approximately %.0fmm", 12.295)
sprintf("%.0f", pi)

sprintf("%s", "A")
sprintf("%d", 10)
sprintf("%04d", 10)
sprintf("%f", pi)
sprintf("%.2f", pi)
sprintf("%1.0f", pi)
sprintf("%50.48f", pi)
sprintf("%8.2f", pi)
sprintf("%08.2f", pi)
sprintf("%+f", pi)
sprintf("%e", pi)
sprintf("%E", pi)


sprintf("The ratio is %d%%", 10) # %% to represent a literal %


#Regular expressions - a very powerful tool to check and filter sting data and extract
#information from raw text.

#Regular expressions - describe the pattern that matches the text and extract the desired 
#part from the text.

#Regular expressions solve problems using two steps: the first is to find a pattern to
#match the text and the second is to group the patterns to extract the information in need.

#Regular expressions provide a set of symbols to represent patterns - for example:
?regex()

fruit <- read_csv("fruits.csv", col_names = FALSE)
print(fruit)

fruit$X1
is.list(fruit) # True

## find matches with grep()
matches <- grep("^\\w+:\\s\\d+$", fruit$X1)
matches

# grep() provides row indices of matching text 
# filter respective rows with indices
(fruit_list <- fruit$X1[matches])

# the 2 steps into one: 
(fruit_list2 <- fruit$X1[grep("^\\w+:\\s\\d+$", fruit$X1)])

# or set values = TRUE in grep() function: 

(fruit_list3 <- grep("^(\\w+):\\s(\\d+)$", fruit$X1, value = TRUE))

fruit_list3 <- as.data.frame(fruit_list3)
print(fruit_list3)
(fruit_list3_df <- separate(fruit_list3, 1, c("fruit", "quantity"), sep = ": "))

#No partial matching: we specify a pattern that starts with ^ and ends with $. 
#If we didnt specify this, regular expressions perform partial matching (defalut).
#I.e. if any part of the string matches the pattern, the whole string is considered
#to match the pattern.


grep("\\d", c("abc", "a12", "123", "1"))
grep("^\\d$", c("abc", "a12", "123", "1"))


## Find matches and extract information using parentheses in regular expression and str_match 
# Parentheses are used to mark parts 

# str_match takes string as input vector 
?str_match

## if we have a text file we can readLines from it; this will directly result in one character vector
# containing all lines read

?readLines
fruits <- readLines("fruits.txt")
# read only n lines:
(fruits_n3 <- readLines("fruits.txt", n = 3))
(fruits_n4 <- readLines("fruits.txt", n = 2))
fruits

is.vector(fruits)

# extract necessary information using str_match and regular expression as well as () 
matches1 <- str_match(fruits, "^(\\w+):\\s(\\d+)$") # two groups (w and d) are marked here
matches1

## if we have a csv file, we can create a character vector by extracting the respective column from the list

fruits2 <-  read_csv("fruits.csv", col_names = FALSE)
print(fruits2) # colname automatically assigned: X1
# extract necessary information and simultaneously coerce data frame into character vector
matches2 <- str_match(fruits2$X1,"^(\\w+):\\s(\\d+)$")
matches2
class(matches2)

## transform to data frame and extract only column needed

fruits_df2 <- data.frame(matches2, stringsAsFactors = FALSE)
fruits_df2
# delete NAs
fruits_df2 <- na.omit(fruits_df2) [, -1]
class(fruits_df2)
fruits_df2

# those 2 steps can be done in one: 
?data.frame
?na.omit
fruits_df2 <- data.frame(na.omit(matches2 [, -1], stringsAsFactors = FALSE))
fruits_df2

# assign colnames
colnames(fruits_df2) <- c("fruit_type", "quantity")
# convert to correct data type
fruits_df2$quantity <- as.numeric(fruits_df2$quantity)
fruits_df2
# add a header
colnames(fruits_df) <- c("fruit","quantity")


telephone <- read_csv("telephone.csv", col_names = FALSE)
telephone$X1
# we have different patterns of telephone numbers here: some 3-5 digits, some 4-4 digits and one 9 digit number
# regular expressions can be used to separate those numbers and save them (temporarily in different 
# data frames)


telephone$X1[grep("^\\d{3}-\\d{5}$", telephone$X1)]
grep("^\\d{3}-\\d{5}$", telephone$X1)
str_match()
telephone$X1[grep("^\\d{4}-\\d{4}$", telephone$X1)]

# regular expression & logical operator
telephone$X1[!grepl("^\\d{3}-\\d{5}$", telephone$X1) & !grepl("^\\d{4}-\\d{4}$", telephone$X1)]



messages <- readLines("messages.txt")

pattern <- "^(\\d+-\\d+-\\d+), (\\d+:\\d+:\\d+), (\\w+), (\\w+),\\s*(.+)$"
(matches <- str_match(messages, pattern))

messages_df <- data.frame(matches[, -1])
colnames(messages_df) <- c("Date", "Time", "Sender", "Receiver", "Message")

messages_df
problems(messages_df)








