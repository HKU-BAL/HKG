library(gdsfmt)
library(SNPRelate)
vcf<-"input.vcf.gz"
snpgdsVCF2GDS(vcf, "input.gds", method="biallelic.only") 
snpgdsSummary("input.gds")