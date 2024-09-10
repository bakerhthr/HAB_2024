library(tidyverse)
library(ggplot2)

GO <- read.delim("bioid v2.txt", header =TRUE, sep = "\t")
GO$Normalized.spectra[GO$Normalized.spectra <= 0] <- NA

ggplot(GO, aes(cat, y=Gene, size = Normalized.spectra, color= BFDR))+
  geom_point(aes(colour = cut(BFDR, c(-10, 0.01, 10))))+
  scale_size_area(max_size = (10), 
                        limits = c(0, 143),
                        breaks=c(5, 25, 50, 75, 100, 125))+
  scale_linewidth() +
  scale_color_manual(name = "BFDR",
                     values = c("(-10,0.01]" = "red",
                                "(0.01,10]" = "grey50"),
                     )+
  theme(text = element_text(size = 5), axis.text.x=element_text(angle = 90, vjust=0.5,hjust=1))+
  theme_minimal()

## to define your own order use factor function 
ggplot(GO, aes(x=factor(cat, level=c("WT DMSO", "A80P DMSO", "WT MG132", "A80P MG132")), y=Gene, size = Normalized.spectra, color= BFDR))+
  geom_point(aes(colour = cut(BFDR, c(-10, 0.01, 10))))+
  scale_size_area(max_size = (10), 
                  limits = c(0, 143),
                  breaks=c(5, 25, 50, 75, 100, 125)) +
  scale_color_manual(name = "BFDR",
                     values = c("(-10,0.01]" = "red",
                                "(0.01,10]" = "grey50"),
                     )+
  theme(text = element_text(size = 5), axis.text.x=element_text(angle = 90, vjust=0.5,hjust=1))+
  theme_minimal()

