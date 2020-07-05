# date and time in base R (Ken p. 190 ff)
current_date <- Sys.Date()
Sys.time()

my_date <- as.Date("2018-02-12")
my_date
date1 <-  my_date + 3
date2 <- my_date - 24
(date3 <- date2 - date1)
(my_time <- as.POSIXlt("2016-02-10 10:25:31"))
(my_time2 <- as.POSIXct("2016-02-10 10:25:31"))

# using format argument
(my_date <- as.Date("2019.01.03", format = "%Y.%d.%m"))
(my_datetime <- as.POSIXlt("7/25/2015 09:30:25", format = "%m/%d/%Y %H:%M:%S"))

?strptime
