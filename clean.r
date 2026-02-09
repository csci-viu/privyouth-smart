library(dplyr)

recode_ratings <- function(file) {
  data <- read.csv(file, stringsAsFactors = FALSE)
  #variable list, update if changed
  var_list <- c("Rating1", "Rating2", "Rating3", "Rating4", "Rating5",
                "Rating6", "Rating7", "Rating8", "Rating9", "Rating10",
                "Rating11", "Rating12", "Rating13", "Rating14", "Rating15",
                "Rating16", "Rating17", "Rating18", "Rating19", "Rating20")


  data <- data %>%
    mutate(across(all_of(var_list),
                  ~ recode(.x,
                    "Strongly disagree" = 1,
                    "Disagree" = 2,
                    "Neutral" = 3,
                    "Agree" = 4,
                    "Strongly Agree" = 5,
                    .default = NA_real_
                  )))

  #file name is placeholder
  write.csv(data, "survey_recoded.csv", row.names = FALSE)
}


reverse_ratings <- function(file) {
  data <- read.csv(file)
  #variable list - this is example
  var_list <- c("Rating1", "Rating2")

  data <- data %>%
    mutate(across(all_of(var_list),
                  ~ recode(.x,
                    `1` = 5,
                    `2` = 4,
                    `3` = 3,
                    `4` = 2,
                    `5` = 1,
                    .default = NA_real_
                  )))

  #file name is placeholder
  write.csv(data, "new_file.csv", row.names = FALSE)
}
