With correct returns and ordered by date prices it is possible to plot HSI (恒生指數) price and return.

```{r lr_5, cache=TRUE}
p1 <- ggplot(hsi.df)
p1 <- p1 + geom_line(aes(x = Date, y = Adjusted.Close), col="darkblue")
p1 <- p1 + labs(title = "Hang Seng Index", x = "Date", y = "Nominal Price (HKD)")

p2 <- ggplot(hsi.df)
p2 <- p2 + geom_line(aes(x = Date, y = Return), col="darkred")
p2 <- p2 + labs(title = "", x = "Date", y = "Monthly Return (%)")

grid.arrange(p1, p2, nrow=2)

p3 <- ggplot(ckh.df)
p3 <- p3 + geom_line(aes(x = Date, y = Adjusted.Close), col="darkblue")
p3 <- p3 + labs(title = "Cheung Kong Holdings Hong Kong", x = "Date", y = "Nominal Price (HKD)")

p4 <- ggplot(ckh.df)
p4 <- p4 + geom_line(aes(x = Date, y = Return), col="darkred")
p4 <- p4 + labs(title = "", x = "Date", y = "Monthly Return (%)")

grid.arrange(p3, p4, nrow=2)
```

Before doing regression we will plot the return distribution and test normality in return distribution. In this case the test must be Shapiro-Wilk as Kolmogorov-Smirov requieres a continuous distribution.

```{r lr_6, cache=TRUE}
p5 <- ggplot(hsi.df, aes(x = Return)) + geom_density()
p5

p6 <- ggplot(ckh.df, aes(x = Return)) + geom_density()
p6

shapiro.test(hsi.df$Return)
shapiro.test(ckh.df$Return)
```

With the previous arrangements, it is possible to show the returns in one plot.

```{r lr_8, cache=TRUE, fig.width=8, fig.height=6}
hsi.ckh.returns.melt <- melt(hsi.ckh.returns, id="Date")  # convert to long format
p7 <- ggplot(data=hsi.ckh.returns.melt, aes(x=Date, y=value, colour=variable))
p7 <- p7 + geom_point() + geom_line()
p7 <- p7 + scale_color_manual("Variable",labels = c("HSI", "CKH"), values = c("royalblue", "red"))
p7 <- p7 + labs(title="Index Comparison", x="Date", y="Return (%)")
p7
```