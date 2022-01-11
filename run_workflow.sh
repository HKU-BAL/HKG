# VEP Annotation
# Use VEP Docker
docker run -t -i -v /Path/VEP/VEP_100:/opt/vep/.vep -v /Path:/root ensemblorg/ensembl-vep
# Run in docker
#The dbNSFP4.0a was used to get the annotations of dbSNP ID, GnomAD population allele frequency, ExAC population allele frequency, SIFT, Polyphen2, MetaSVM, MetaLR, CADD, GERP++, phyloP100way, phastCons100way, 1000 Genomes population allele frequency, Exome Variant Server population allele frequency, and ClinVar Clinical significance. The ClinVar version 2020-07-06 was used as a custom annotation in VEP to retrieve the pathogenic variants. We used GATK LiftoverVcf to liftover the CIViC39 (version 2020-08-07) database from GRCh37 to GRCh38 before using it to get the druggable variants.
sh vep.sh

# Principal component analysis (PCA) (R script)
# Convert the VCF to GDS after merging the VCF files
R CMD BATCH convertVCF2RDS.R
# Perform PCA
R CMD BATCH PCA.R
# Generate the scatter plot of PCA
R CMD BATCH scatterPlot_PCA.R
# Generate the density plot of PCA
R CMD BATCH densityPlot_PCA.R

# Identical-by-Descent (IBD) Analyses
# Run BEAGLE 4.1 iterated 15 times.
java -jar beagle.27Jan18.7e1.jar niterations=15 gt=input.vcf.gz out=output
# Run IBD 15 indipendent times using random seed between 1 and 10,000
sh IBD.sh

# Admixture
R CMD BATCH admixture.R

#Reference:
#https://hub.docker.com/r/ensemblorg/ensembl-vep
#https://asia.ensembl.org/info/docs/tools/vep/script/vep_options.html
#https://www.bioconductor.org/packages/devel/bioc/vignettes/SNPRelate/inst/doc/SNPRelate.html
#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5986695/
#https://vcru.wisc.edu/simonlab/bioinformatics/programs/admixture/admixture-manual.pdf
#http://www.royfrancis.com/pophelper/articles/index.html
#https://faculty.washington.edu/browning/beagle/b4_1.html
#https://www.protocols.io/view/genotype-imputation-workflow-v3-0-nmndc5e?version_warning=no&step=1
