# 🔄 Clear environment
rm(list = ls())

# 📦 Load required packages
library(jmvcore)

# 🔁 Source R6_classes.R first — ensure it has `browser()` in the run() method
source("R/R6_classes.R")

# 🔁 Then source all other R files (if needed)
other_files <- list.files("R", pattern = "\\.R$", full.names = TRUE)
other_files <- other_files[!grepl("R6_classes\\.R$", other_files)]
lapply(other_files, source)

# 📄 Load your test data
dat <- read.csv("scalmj_checks/Original_Data/GEMS_Dataset.csv")

# 🧪 Call the adjusting() function — will trigger Adjusting$run()
results <- adjusting(
  data = dat,
  dep = "Score",
  factors = "Sex",
  covs = c("Age", "Education"), method = "comb"
)

# 📊 Inspect results (optional)
print(results)
