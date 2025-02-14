# Load necessary library
library(ggplot2)

# Step 1: Load the data
url <- "https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/refs/heads/master/challenge/2025/challenge02/data.csv"
data <- read.csv(url)

# Step 2: Order the data so that 1874 is on top and 1899 at the bottom
data$Date <- factor(data$Date, levels = sort(unique(data$Date), decreasing = TRUE))

# Step 3: Create the horizontal bar plot with modifications
ggplot(data, aes(x = Land, y = Date)) + 
  geom_bar(stat = "identity", fill = "red") +  # Make bars red
  geom_text(data = subset(data, Date %in% c(1874, 1899)), 
          #  aes(label = Land), hjust = 1.5, color = "black", size = 6) 
+ # Add text inside bars
  labs(title = "ACRES OF LAND OWNED BY NEGROES IN GEORGIA in Georgia.") +
  theme_minimal(base_size = 15) +
  theme(
    plot.background = element_rect(fill = "papaya whip", color = NA),  # Set background color
    panel.background = element_rect(fill = "papaya whip", color = NA)
   # axis.text.y = element_text(face = "bold")  # Make y-axis labels bold for better readability
  )
