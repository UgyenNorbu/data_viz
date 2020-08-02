library(tidyverse)
anscombe %>% 
    ggplot(aes(x = x1, y = y1)) +
    geom_point() 
