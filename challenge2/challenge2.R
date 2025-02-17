# Load necessary library
library(ggplot2)

# Step 1: Load the data
url <- "https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/refs/heads/master/challenge/2025/challenge02/data.csv"
data <- read.csv(url)

# Step 2: Order the data so that 1874 is on top and 1899 at the bottom
data$Date <- factor(data$Date, levels = sort(unique(data$Date), decreasing = TRUE))

# Step 3: Create the horizontal bar plot with space between bars
ggplot(data, aes(x = Land, y = Date)) + 
  geom_bar(stat = "identity", fill = "red", width = 0.7) +  # Adjust width to add space between bars
  geom_text(data = subset(data, Date %in% c(1874, 1899)), 
            aes(label = Land), hjust = c(3, 8), color = "black", size = 4) + # Adjust hjust for centering
  labs(title = "ACRES OF LAND OWNED BY NEGROES", 
       subtitle = "IN GEORGIA",
       caption = "Created by: SimisaniNdaba") +  # Add caption here
  theme_minimal(base_size = 15) +
  theme(
    plot.background = element_rect(fill = "papaya whip", color = NA),  # Set background color
    panel.background = element_rect(fill = "papaya whip", color = NA),
    axis.title.x = element_blank(),  # Remove x-axis label (Land)
    axis.title.y = element_blank(),  # Remove y-axis label (Date)
    axis.text.x = element_blank(),   # Remove x-axis ticks
    plot.title = element_text(hjust = 0.5, size = 18, color = "black", face = "bold"),  # Bold title
    plot.subtitle = element_text(hjust = 0.5, size = 18, color = "black", face = "bold"),  # Bold title
    plot.caption = element_text(hjust = 0.5, size = 12, color = "black", face = "bold"),  # Bold caption
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank()   # Remove minor grid lines
    )


# Save the plot to a file using ggsave
ggsave("2025challenge2.png", 
       width = 9, height = 12, dpi = 300)  # Save as PNG with specific dimensions and resolution
