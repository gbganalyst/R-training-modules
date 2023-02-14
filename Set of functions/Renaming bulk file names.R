# Renaming files, extension, or padding texts in R

library(fs)
library(stringr)

# list files with .mp4

mp4_names <- dir_ls(glob = "*.mp4")

# renaming .mp4 to .mp3

mp3_names <- str_replace(string = mp4_names,
                         pattern = "mp4",
                         replacement = "mp3")

# Effect the change in the directory

file_move(path = mp4_names,
          new_path = mp3_names)

# Padding text in R

old_names <- dir_ls()

# Padding the begining of the text with Ezekiel_

new_names <- str_c("Ezekiel_", old_names)

# Effect the change in the directory

file_move(path = old_names,
          new_path = new_names)