setwd("~/Desktop/datamining/HW1_data_preprocessing/data mining hw1")
file2008=read.csv("reibur_2008.csv")
file2009=read.csv("reibur_2008.csv")
file2010=read.csv("reibur_2008.csv")

## convert state code to state abra
#'x' is the column of a data.frame that holds 2 digit state codes
stateFromLower <-function(x) {
  st.codes<-data.frame(
    state=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
            "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22",
            "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33",
            "34", "35", "36", "37", "38", "39", "41", "42", "43", "44",
            "45", "46", "47", "49", "50", "51", "52", "53", "54"),
    full=as.factor(c('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA',
                     'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 
                     'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 
                     'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX',
                     'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY','Others'))
  )
  #create an nx1 data.frame of state codes from source column
  st.x<-data.frame(state=x)
  #match source codes with codes from 'st.codes' local variable and use to return the full state name
  refac.x<-st.codes$full[match(st.x$state,st.codes$state)]
  #return the full state names in the same order in which they appeared in the original source
  return(refac.x)
  
}

file2008$SP_STATE_CODE = stateFromLower(file2008$SP_STATE_CODE)
file2009$SP_STATE_CODE = stateFromLower(file2009$SP_STATE_CODE)
file2010$SP_STATE_CODE = stateFromLower(file2010$SP_STATE_CODE)

# create year column

file2008$Year = as.factor('2008')
file2009$Year = as.factor('2009')
file2010$Year = as.factor('2010')

#take samples
s2008 <- file2008[sample(1:nrow(file2008), 1000,replace=FALSE),]
s2009 <- file2009[sample(1:nrow(file2009), 1000,replace=FALSE),]
s2010 <- file2010[sample(1:nrow(file2010), 1000,replace=FALSE),]

sample = rbind(s2008,s2009,s2010)
sumdt = rbind(file2008, file2009, file2010)
sumdt$X = NULL

# save sum file
write.csv(sample, "sample.csv")

write.csv(sumdt, "sumDatebase.csv")

sumdf <- read.csv("sample.csv", header = TRUE)

