# in Anlehnung an p. 187, Ren

dates <- c("Jan 3", "Feb 10", "Nov 15")
dates <- strsplit(dates, split = " ") # results in a list
dates <- as.data.frame(dates, stringsAsfactors = FALSE)

dates
rownames(dates) <- NULL
colnames(dates) <- NULL
dates
dates <- t(dates) # results in matrix
dates <- as.data.frame(dates, stringsAsfactors = FALSE) # neccessary because t() function results in matrix
dates
is.data.frame(dates) # check if actually a data frame
colnames(dates) <- c("month", "day")
dates
str(dates) # we see that although stringAsfactors has been set to false, both variables are factors
dates[[2]] <- as.numeric(as.character(dates[[2]])) # set column "day" to numeric vector
dates
dates[[1]] <- as.character(dates[[1]]) # set column "month" to character vector
dates
str(dates) # both columns occur in the more suitable data types (character and numeric) now

showMethods(coerce)



# from BaseR_Strings Lecture
# those 2 steps can be done in one: 
fruits_df2 <- data.frame(na.omit(matches2 [, -1], stringsAsFactors = FALSE))
# check why I can insert selection of rows from one data frame (matches2) into na.omit and simultaneouelsy
# coerce matches 2 to data frame

telephone$X1[grep("^\\d{3}-\\d{5}$", telephone$X1)]
telephone$X1[grep("^\\d{4}-\\d{4}$", telephone$X1)]


telephone$X1[!grepl("^\\d{3}-\\d{5}$", telephone$X1) & !grepl("^\\d{4}-\\d{4}$", telephone$X1)]