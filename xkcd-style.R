
### Creating an XKCD style chart
```{r, cache=TRUE}
#font_import(pattern="[X/x]kcd")
#fonts()

fill2 <- c("#56B4E9", "#F0E442")
p8 <- ggplot() + 
  geom_area(aes(y = export, x = year, fill = product), data = barcharts.data, stat="identity") + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)") + 
  scale_fill_manual(values=fill2) + 
  theme(axis.line = element_line(size=1)) + 
  theme(axis.line = element_line(colour = "black"), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.border = element_blank(), panel.background = element_blank()) + 
  theme(plot.title=element_text(family="xkcd-Regular"), text=element_text(family="xkcd-Regular"), axis.text.x=element_text(colour="black", size = 10), axis.text.y=element_text(colour="black", size = 10)) 
p8
```

### Creating an XKCD style chart
```{r, cache=TRUE}
#font_import(pattern="[X/x]kcd")
#fonts()

fill2 <- c("#56B4E9", "#F0E442")
p9 <- ggplot() + 
  geom_bar(aes(y = export, x = year, fill = product), data = barcharts.data, stat="identity") + 
  geom_text(data=barcharts.data, aes(x = year, y = pos, label = export), colour="black", family="xkcd-Regular", size = 4, show_guide = F) + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  labs(x="Year", y="USD million") + 
  ggtitle("Composition of Exports to China ($)") + 
  scale_fill_manual(values=fill2) + 
  theme(axis.line = element_line(size=1)) + 
  theme(axis.line = element_line(colour = "black"), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.border = element_blank(), panel.background = element_blank()) + 
  theme(plot.title=element_text(family="xkcd-Regular"), text=element_text(family="xkcd-Regular"), axis.text.x=element_text(colour="black", size = 10), axis.text.y=element_text(colour="black", size = 10)) 
p9
```

### Creating an XKCD style chart
```{r, cache=TRUE}
#font_import(pattern="[X/x]kcd")
#fonts()

fill2 <- c("#56B4E9", "#F0E442")
p10 <- ggplot() + 
  geom_bar(aes(y = percentage, x = year, fill = product), data = barcharts.data, stat="identity") + 
  geom_text(data=barcharts.data, aes(x = year, y = pos, label = paste0(percentage,"%")), colour="black", family="xkcd-Regular", size = 5, show_guide = F) + 
  theme(legend.position="bottom", legend.direction="horizontal", legend.title = element_blank()) + 
  scale_x_continuous(breaks=seq(2006,2014,1)) + 
  scale_y_continuous(labels = dollar_format(suffix = "%", prefix = "")) + 
  labs(x="Year", y="Percentage") + 
  ggtitle("Composition of Exports to China (%)") + 
  scale_fill_manual(values=fill2) + 
  theme(axis.line = element_line(size=1)) + 
  theme(axis.line = element_line(colour = "black"), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.border = element_blank(), panel.background = element_blank()) + 
  theme(plot.title=element_text(family="xkcd-Regular"), text=element_text(family="xkcd-Regular"), axis.text.x=element_text(colour="black", size = 10), axis.text.y=element_text(colour="black", size = 10)) 
p10
```