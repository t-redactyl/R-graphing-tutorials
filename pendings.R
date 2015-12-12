setwd("/Users/pacha/R-graphing-tutorials/")

## Regression plot

### Basic graph
```{r, cache=TRUE}
charts.data <- read.csv("charts.csv")
charts.data <- charts.data[charts.data$product == "copper",]
charts.data$year <- as.numeric(charts.data$year)
charts.data$export <- as.numeric(charts.data$export)

library(ggplot2)

p6 <- ggplot() + geom_point(aes(y = export, x = year), shape=1, data = charts.data) + geom_smooth()
p6
```

### Adding trend line
```{r, cache=TRUE}
p6 <- ggplot() + geom_point(aes(y = export, x = year), shape=1, data = charts.data) + 
  geom_smooth(method = "lm", se=FALSE, color="black")
p6
```

### Customizing legend position
```{r, cache=TRUE}
library(plyr)
charts.data <- ddply(charts.data, .(year), transform, pos = cumsum(export) - (0.5 * export))

p6 <- p6 + theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())
p6
```

### Changing variables display
```{r, cache=TRUE}
charts.data <- as.data.frame(charts.data)
charts.data$product <- factor(charts.data$product, levels = c("copper","others"), labels = c("Copper","Pulp wood, Fruit, Salmon & Others"))

p6 <- ggplot() + geom_point(aes(y = export, x = year, shape=1), data = charts.data, stat="identity") + theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank())
p6
```

### Adjusting x-axis scale
```{r, cache=TRUE}
library(scales)
p6 <- p6 + scale_x_continuous(breaks=seq(2006,2014,1))
p6
```

### Adjusting axis labels & adding title
```{r, cache=TRUE}
p6 <- p6 + ggtitle("Composition of Exports to China ($)") + labs(x="Year", y="USD million") 
p6
```

### Adjusting color palette
```{r, cache=TRUE}
colour <- c("#5F9EA0", "#E1B378")
p6 <- p6 + scale_colour_manual(values=colour)
p6
```

### Using white theme
```{r, cache=TRUE}
p6 <- ggplot() + theme_bw() +
  geom_point(aes(y = export, x = year, shape=1), data = charts.data, stat="identity") + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)") + 
  scale_colour_manual(values=colour)
p6
```

### Using 'The Economist' theme 
```{r, cache=TRUE}
# install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)
library(extrafont)
#font_import(pattern="[O/o]fficina")
#fonts()

p6 <- ggplot() + theme_economist() + scale_colour_economist() +   theme(plot.title=element_text(family="OfficinaSanITC-Book"), text=element_text(family="OfficinaSanITC-Book")) +
  geom_point(aes(y = export, x = year, shape=1), data = charts.data, stat="identity") + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)")
p6
```

### Using 'Five Thirty Eight' theme 
```{r, cache=TRUE}
#install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)
library(extrafont)
#font_import(pattern="[A/a]tlas")
#fonts()
p6 <- ggplot() + theme_fivethirtyeight() + scale_colour_fivethirtyeight() +   theme(plot.title=element_text(family="Atlas Grotesk Medium"), text=element_text(family="Atlas Grotesk Light")) +
  geom_point(aes(y = export, x = year, shape=1), data = charts.data, stat="identity") + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)")
p6
```

### Creating your own theme
```{r, cache=TRUE}
p6 <- ggplot() + 
  geom_point(aes(y = export, x = year, shape=1), data = charts.data, stat="identity") + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)") + 
  scale_colour_manual(values=colour) + 
  theme(axis.line = element_line(size=1)) + 
  theme(axis.line = element_line(colour = "black"), panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(), panel.border = element_blank(), panel.background = element_blank()) + 
  theme(plot.title=element_text(family="AdobeHeitiStd-Regular"), text=element_text(family="AdobeHeitiStd-Regular"), axis.text.x=element_text(colour="black", size = 10), axis.text.y=element_text(colour="black", size = 10)) 
p6
```