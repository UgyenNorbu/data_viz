library(tidyverse)
library(socviz)
library(gapminder)
library(MASS)
library(splines)
library(quatreg)

gapminder %>% 
    ggplot(aes(x = log(gdpPercap), y = lifeExp)) +
    geom_point(alpha = 0.3) +
    geom_smooth(color = "tomato", fill = "tomato", method = MASS::rlm) +
    geom_smooth(color = "steelblue", fill = "steelblue", method = "lm")
    
gapminder %>% 
    ggplot(aes(x = log(gdpPercap), y = lifeExp)) +
    geom_point(alpha = 0.3) +
    geom_smooth(color = "tomato", method = "lm", size = 1.5,
                formula = y~splines::bs(x, 3), se = FALSE)

gapminder %>% 
    ggplot(aes(x = log(gdpPercap), y = lifeExp)) +
    geom_point(alpha = 0.3) +
    geom_quantile(color = "tomato", size = 1.2, method = "rqss",
                  lambda = 1, quantiles = c(0.20, 0.5, 0.85))

mod_color <- RColorBrewer::brewer.pal(3, "Set1")

gapminder %>% 
    ggplot(aes(x = log(gdpPercap), y = lifeExp)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "lm", aes(color = "OLS", fill = "OLS")) + 
    geom_smooth(method = "lm", formula = y ~ splines::bs(x, df = 3),
                aes(color = "Cubic Spline", fill = "Cubic Spline")) + 
    geom_smooth(method = "loess",
                aes(color = "LOESS", fill = "LOESS")) +
    scale_color_manual(name = "Models", values = mod_color) + 
    scale_fill_manual(name = "Models", values = mod_color) + 
    theme(legend.position = "top")

out <- lm(formula = lifeExp ~ gdpPercap + pop + continent, data = gapminder)

