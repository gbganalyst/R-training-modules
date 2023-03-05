library(tidyverse)
library(skimr)
library(readxl)

# ggplot theme

theme_set(theme_bw())

call_center_data <- read_excel("callcentre_01.xlsx", na = "NA")

hr_data <- read_excel("HRM_01.xlsx", na = "NA") %>% mutate(agent = as.numeric(agent))

combined_data <- hr_data %>% left_join(call_center_data, by = "agent", multiple = "all")

# Remove any rows with missing variables

complete_data <- combined_data %>% 
  drop_na() %>% filter(ethnicity != 6)

complete_data <- complete_data %>% 
  mutate(across(c(1, 4, 5, 9, 10, 12), as.factor))

glimpse(complete_data)
skim(complete_data)

#Employer's KPI - 

complete_data %>% 
  count(ethnicity, sort = TRUE)





complete_data %>% count(time, customer_satisfaction) %>% ggplot(aes(x = time, y = n, fill = customer_satisfaction))+ geom_col(position = position_dodge()) + labs(x = "Time of the day (in hrs)", fill = "Customer satisfaction", y = "Number of calls", title = "Customer satisfaction by gender")



complete_data %>% count(gender, customer_satisfaction) %>% ggplot(aes(x = customer_satisfaction, y = n, fill = gender))+ geom_col(position = position_dodge()) + labs(x = "Customer satisfaction", fill = "Gender", y = "Number of calls", title = "Customer satisfaction by time of the day")


complete_data %>% count(ethnicity, customer_satisfaction) %>% ggplot(aes(x = customer_satisfaction, y = n, fill = ethnicity))+ geom_col(position = position_dodge()) + labs(x = "Customer satisfaction", fill = "Ethnicity", y = "Number of calls", title = "Customer satisfaction by ethnicity")



complete_data %>% count(qualification, customer_satisfaction) %>% ggplot(aes(x = customer_satisfaction, y = n, fill = qualification))+ geom_col(position = position_dodge()) + labs(x = "Customer satisfaction", fill = "qualification", y = "Number of calls", title = "Customer satisfaction by qualification")
