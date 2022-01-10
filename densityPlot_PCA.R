library(ggplot2)
library(tibble)
library(patchwork)
library(hrbrthemes)
tab <- read.table ("input.txt", na = "NA", dec = ".", header=TRUE)
y_range <- range(tab$EV1)
tab$pop <- factor(tab$pop, levels = c("POP1", "POP2", "POP3", "POP4"))
p1 <- ggplot(data = tab, aes(x=tab$EV2, y=tab$EV1)) +
  geom_point(aes(color=tab$pop,shape=tab$pop),show.legend = FALSE) +
  scale_shape_manual(values = c(16, 16, 4,16)) +
  xlim(-0.1,0.1)+
  scale_y_continuous(limits = y_range)+
  scale_y_reverse()+
  theme_ipsum()+
  xlab("PC2") +
  ylab("PC1")
p2_dens <- ggplot(tab, aes(x=tab$EV1,group=pop,fill=pop)) +
  geom_density(adjust=1.5, alpha=.4) +
  coord_flip() +
  scale_x_continuous(limits = y_range)+
  scale_x_reverse()+
  theme_ipsum()+
  ylab("Number of samples") +
  xlab("")+
  labs(fill = "Population")
p1 + p2_dens + plot_layout(nrow = 1)