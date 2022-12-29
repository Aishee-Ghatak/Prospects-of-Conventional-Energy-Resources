library(readxl)
avgas <- read_excel("F:/Project/Availability of Energy Resources.xlsx", col_types = c("skip", "skip", "skip", "numeric"))
View(avgas)
avgastimeseries <- ts(avgas, start = c(2010,1))
plot.ts(avgastimeseries)
library("TTR")
avgasSMA3 <- SMA(avgastimeseries, n=3)
plot.ts(avgasSMA3)
avgasSMA5 <- SMA(avgastimeseries, n=5)
plot.ts(avgasSMA5)
avgasforecasts <- HoltWinters(avgastimeseries, beta = FALSE, gamma = FALSE)
avgasforecasts
avgasforecasts$fitted
plot(avgasforecasts)
avgasforecasts$SSE
library("forecast")
avgasforecasts2 <- forecast(avgasforecasts, h=5)
plot(avgasforecasts2)