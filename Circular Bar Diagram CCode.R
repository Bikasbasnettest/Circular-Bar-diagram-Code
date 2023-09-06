library(ggplot2)
library(RColorBrewer)

Predictive_variable <- letters[1:26]
Response_variable <- sample(10:100, 26)

# Generate random error values between 0.1 and 0.8 for each bar
errors <- runif(26, min = 0.1, max = 0.8)

df <- data.frame(Predictive_variable, Response_variable, errors)

# Use the Set3 color palette with 26 distinct colors
my_colors <- brewer.pal(12, "Set3")[1:26]  # Select the first 26 colors from the palette

gg <- ggplot(data = df, aes(x = reorder(Predictive_variable, -Response_variable), y = Response_variable, fill = Predictive_variable)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = Response_variable - errors, ymax = Response_variable + errors), width = 0.2) +
  scale_fill_manual(values = my_colors) +
  theme_minimal() +
  theme(legend.position = "none") +
  coord_polar(start = 0) +
  ylim(-50, 100)  # Set radial axis 
# Highlight all radial gridlines
# Highlight inner gridlines while leaving outer gridlines
highlight_inner_gridlines <- gg +
  theme(panel.grid.major = element_line(color = "darkgreen", size = 0.25))  # Customize the color and size

# Print the plot
print(highlight_inner_gridlines)


scale_lines <- gg +
  geom_hline(yintercept = seq(0, 100, by = 20), color = "gray", linetype = "dashed")
# Add labels for the vertical scale lines, excluding -50%
division_units <- scale_lines +
  annotate("text", x = -5, y = seq(0, 100, by = 20), label = c("0%", "20%", "40%", "60%", "80%", "100%"))

# Print the plot
print(division_units)

