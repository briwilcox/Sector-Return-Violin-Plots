library(quantmod)
library(ggplot2)

# Get Vangaurd Sector ETFs
getSymbols("VCR", from="2008-01-01")
getSymbols("VDC", from="2008-01-01")
getSymbols("VDE", from="2008-01-01")
getSymbols("VFH", from="2008-01-01")
getSymbols("VHT", from="2008-01-01")
getSymbols("VIS", from="2008-01-01")
getSymbols("VGT", from="2008-01-01")
getSymbols("VAW", from="2008-01-01")
getSymbols("VNQ", from="2008-01-01")
getSymbols("VOX", from="2008-01-01")
getSymbols("VPU", from="2008-01-01")

#Calculate Monthly Returns
monthlyStockReturns = data.frame(monthlyReturn(VCR),
                                   monthlyReturn(VDC),
                                   monthlyReturn(VDE),
                                   monthlyReturn(VFH),
                                   monthlyReturn(VHT),
                                   monthlyReturn(VIS),
                                   monthlyReturn(VGT),
                                   monthlyReturn(VAW),
                                   monthlyReturn(VNQ),
                                   monthlyReturn(VOX),
                                   monthlyReturn(VPU))

# Label Data
colnames(monthlyStockReturns) <- c("Consumer Discretionary", "Consumer Staples", "Energy",
                                     "Financials", "Health Care", " Industrials", "Information Technology", 
                                     "Materials", "REIT", "Telecommunication Services", "Utilities")

# Reshape Data
monthlyStockReturns.melt <- reshape2::melt(monthlyStockReturns, id.vars = NULL)

# Plot Data
ggplot(monthlyStockReturns.melt, aes(x = variable, y = value*100)) +
  labs(x = "Stock Sector (Vangaurd Sector ETFs)",
       y = "Monthly Returns in Percentage",
       title = "Violin Plot of Monthly US Stock Returns by Sector - brianmwilcox.com") +
  geom_violin(aes(colour=variable, fill=variable)) 