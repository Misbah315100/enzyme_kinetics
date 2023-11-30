# Data from the table
volume_of_6gp <- c(200, 100, 50, 25, 10)
concentration_of_g6p <- c(1, 0.5, 0.25, 0.125, 0.05)
change_in_absorbancy_340_min_1_without_dhea <- c(0.114, 0.107, 0.088, 0.071, 0.047)
change_in_absorbancy_340_min_1_with_dhea <- c(0.039, 0.034, 0.033, 0.03, 0.032)

# Calculate the inverse of the concentration and the rate
inverse_concentration_of_g6p_without_dhea <- 1 / concentration_of_g6p
inverse_rate_without_dhea <- 1 / change_in_absorbancy_340_min_1_without_dhea

inverse_concentration_of_g6p_with_dhea <- 1 / concentration_of_g6p
inverse_rate_with_dhea <- 1 / change_in_absorbancy_340_min_1_with_dhea

# Plot the Hanes-Woolf plot
plot(inverse_concentration_of_g6p_without_dhea, inverse_rate_without_dhea, xlab = "1/[G6P] (mM)", ylab = "1/V (min)", main = "Hanes-Woolf Plot")
lines(inverse_concentration_of_g6p_with_dhea, inverse_rate_with_dhea, col = "red")

# Calculate the Km and Vmax values
model_without_dhea <- lm(inverse_rate_without_dhea ~ inverse_concentration_of_g6p_without_dhea)
Km_without_dhea <- 1 / coef(model_without_dhea)[2]
Vmax_without_dhea <- 1 / coef(model_without_dhea)[1]

model_with_dhea <- lm(inverse_rate_with_dhea ~ inverse_concentration_of_g6p_with_dhea)
Km_with_dhea <- 1 / coef(model_with_dhea)[2]
Vmax_with_dhea <- 1 / coef(model_with_dhea)[1]

# Print the Km and Vmax values
cat("Km without DHEA:", Km_without_dhea, "\n")
cat("Vmax without DHEA:", Vmax_without_dhea, "\n")
cat("Km with DHEA:", Km_with_dhea, "\n")
cat("Vmax with DHEA:", Vmax_with_dhea, "\n")

