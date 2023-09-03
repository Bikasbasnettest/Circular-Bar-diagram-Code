library(ggplot2)
library(RColorBrewer)

Predictive_variable <- letters[1:26]
Response_variable <- sample(10:100, 26)

# Generate random error values between 0.1 and 0.8 for each bar
errors <- runif(26, min = 0.1, max = 0.8)

df <- data.frame(Predictive_variable, Response_variable, errors)

# Use the Set3 color palette with 26 distinct colors
my_colors <- brewer.pal(12, "Set3")[1:26]  # Select the first 26 colors from the palette

ggplot(data = df, aes(x = Predictive_variable, y = Response_variable, fill = Predictive_variable)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = Response_variable - errors, ymax = Response_variable + errors), width = 0.2) +  # Add error bars
  scale_fill_manual(values = my_colors) +  # Specify the custom colors directly
  theme_minimal() +
  theme(legend.position = "none") +
  coord_polar(start = 0) +
  ylim(-50, 100)
