install.packages("readxl")
library(readxl)
enzyme_kinetics <- read_xlsx("enzyme_data.xlsx")
head(enzyme_kinetics)

time <- enzyme_data$`Time (seconds)`
absorbance_a <- enzyme_data$`Sample A (absorbance at 340 nm)`
absorbance_b <- enzyme_data$`sample B (absorbance at 340 nm)`

time_in_mins <- time/60
initial_rate_a <- (absorbance_a[length(absorbance_a)])
initial_rate_b <- (absorbance_b[length(absorbance_b)])

cat("Initial rate of increase in absorbance for Sample A:", initial_rate_a, "ΔA340.min-1\n")
cat("Initial rate of increase in absorbance for Sample B:", initial_rate_b, "ΔA340.min-1\n")

plot(time_in_minutes, absorbance_a, col = "blue", type = "l", xlab = "Time (minutes)", ylab = "Absorbance at 340 nm", main = "Absorbance vs. Time for Samples A and B")
lines(time_in_minutes, absorbance_b, col = "red")

legend("topleft", c("Sample A", "Sample B"), col = c("blue", "red"), lty = c(1, 1))

