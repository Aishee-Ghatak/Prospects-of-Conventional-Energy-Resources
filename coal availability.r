library(readxl)
avcoal <- read_excel("F:/Project/Availability of Energy Resources.xlsx",
                     col_types = c("skip", "numeric", "skip",
                                   "skip"))
View(avcoal)
avcoaltimeseries <- ts(avcoal, start = c(2010,1))
plot.ts(avcoaltimeseries)
library("TTR")
avcoalSMA3 <- SMA(avcoaltimeseries, n=3)
plot.ts(avcoalSMA3)
avcoalforecasts <- HoltWinters(avcoaltimeseries, beta = FALSE, gamma = FALSE)
avcoalforecasts
avcoalforecasts$fitted
plot(avcoalforecasts)
avcoalforecasts$SSE
library("forecast")
avcoalforecasts2 <- forecast(avcoalforecasts, h=5)
plot(avcoalforecasts2)