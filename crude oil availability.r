library(readxl)
avoil <- read_excel("F:/Project/Availability of Energy Resources.xlsx", col_types = c("skip", "skip", "numeric", "skip"))
View(avoil)
avoiltimeseries <- ts(avoil, start = c(2010,1))
plot.ts(avoiltimeseries)
library("TTR")
avoilSMA3 <- SMA(avoiltimeseries, n=3)
plot.ts(avoilSMA3)
avoilforecasts <- HoltWinters(avoiltimeseries, beta = FALSE, gamma = FALSE)
avoilforecasts
avoilforecasts$fitted
plot(avoilforecasts)
avoilforecasts$SSE
library("forecast")
avoilforecasts2 <- forecast(avoilforecasts, h=5)
plot(avoilforecasts2)