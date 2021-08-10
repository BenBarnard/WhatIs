library(ggplot2)
library(dplyr)

alpha <- round(qnorm(.975),2)  

data_df <- tibble(x = seq(-4, 7, length = 1000),
       z = dnorm(x, mean = 0, sd = 1),
       y = dnorm(x, mean = 3, sd = 1),
       type2 = x < alpha)

ggplot(data = data_df, aes(x = x, y = z)) +
  geom_line(size = 1) + 
  geom_area(fill = "light gray") +
  geom_line(aes(x = x, y = y), size = 1) +
  geom_area(aes(x = x, y = y, fill = type2)) + 
  scale_fill_manual(values = c("red", "green")) + 
  geom_vline(aes(xintercept = alpha), size = 1, linetype = 2) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.line.x = element_line(colour = "black"))

               