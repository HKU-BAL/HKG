library(gdsfmt)
library(SNPRelate)
genofile <- snpgdsOpen("input.gds")
pca <- snpgdsPCA(genofile, eigen.cnt=8, num.thread=10)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))
sample.id <- read.gdsn(index.gdsn(genofile, "sample.id"))
pop_code <- scan("sample_id", what=character())
tab <- data.frame(sample.id = pca$sample.id,
    pop = factor(pop_code)[match(pca$sample.id, sample.id)],
    EV1 = pca$eigenvect[,1],    # the first eigenvector
    EV2 = pca$eigenvect[,2],    # the second eigenvector
    EV3 = pca$eigenvect[,3],    # the third eigenvector
    EV4 = pca$eigenvect[,4],    # the fourth eigenvector
    EV5 = pca$eigenvect[,5],    # the fifth eigenvector
    EV6 = pca$eigenvect[,6],    # the sixth eigenvector
    EV7 = pca$eigenvect[,7],    # the seventh eigenvector
    EV8 = pca$eigenvect[,8],    # the eighth eigenvector
    stringsAsFactors = FALSE)
saveRDS(tab, file = "output.rds")
write.table(tab, file = "output.txt", sep = "  ", eol = "\n", na = "NA", dec = ".", row.names = TRUE, col.names = TRUE)
dev.off()