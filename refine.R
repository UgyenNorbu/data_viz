library(tidyverse)
library(ggrepel)
library(ggthemes)

asasec %>% 
    View()
colnames(asasec)

new_data 

new_data <- subset(x = asasec, Year == 2014)

new_data %>% 
    ggplot(aes(x = Members, y = Revenues, label = Sname)) +
    geom_point(aes(color = Journal)) +
    geom_smooth(method = "lm", color = "#1874CD", fill = "#CAE1FF") +
    geom_text_repel(data = subset(asasec, Year == 2014 & Revenues > 7000)) +
    ylim(0, 30000) +
    theme_minimal()
