library(ggplot2)
library(RColorBrewer)

BIKU<-read.csv("E:/NARC2/Yield circular Diagram.csv", header = TRUE)
BIKU
# Generate random error values between 0.1 and 0.8 for each bar
# Generate random error values between 0.1 and 0.8 for each observation
errors <- runif(nrow(BIKU), min = 0.1, max = 0.8)


# Use the Set3 color palette with 26 distinct colors
my_colors <- brewer.pal(12, "Set3")[1:45]

gg <- ggplot(data = BIKU, aes(x = reorder(factor(GEN), Y.ha), y = Y.ha, fill = GEN)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = Y.ha - errors, ymax = Y.ha + errors), width = 0.2) +
  scale_fill_manual(values = my_colors) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels by 45 degrees
  coord_polar(start = 0) +
  ylim(0, 10)
print(gg)
highlight_inner_gridlines <- gg +
  theme(panel.grid.major = element_line(color = "darkgreen", size = 0.25))  # Customize the color and size

# Print the plot
print(highlight_inner_gridlines)
ggsave(filename = "Circular Plot of the yield R.jpg", plot = highlight_inner_gridlines,
       width = 20, height = 15, dpi = 800, units = "cm")
