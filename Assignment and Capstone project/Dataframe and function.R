#assignment 1

gender <- c("female", "female","male","male","male","male")

Age <- c(27, 32, NA, 29, 47, 45)

Estimatedsalary <- c(NA, 150000, 33000, 80000, 25000, 22000)

Purchase <- c("not-purchase", "purchase", "not-purchase", "not-purchase", NA, "purchase")

Employee_income <- data.frame(gender,Age,Estimatedsalary,Purchase)



Employee_income

anyNA(Employee_income)

sum(is.na(Employee_income))

is.na(Employee_income) %>% sum()



cel_fah <- function(celcius) {
  result = celcius * 1.8 + 32
  return(result)
}

# 100
# 75
# 120
