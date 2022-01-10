library(pophelper)
library(gridExtra)

#color
clist <- list(
"shiny"=c("#1D72F5","#DF0101","#77CE61", "#FF9326","#A945FF","#0089B2","#FDF060","#FFA6B2","#BFF217","#60D5FD","#CC1577","#F2B950","#7FB21D","#EC496F","#326397","#B26314","#027368","#A4A4A4","#610B5E"),
"standard_15"=c("#2121D9","#9999FF","#DF0101","#04B404","#FFFB23","#FF9326","#A945FF","#0089B2","#B26314","#610B5E","#FE2E9A","#BFF217","#f0e442","#e69f00","#56b4e9"))
# add length of palettes
lengths <- sapply(clist,length)
names(clist) <- paste0(names(clist),"_",lengths)

par(mar=c(0.2,6,0.2,0))
par(mfrow=c(length(clist),1))

for(i in 1:length(clist))
{
  {barplot(rep(1,max(lengths)),col=c(clist[[i]],rep("white",max(lengths)-length(clist[[i]]))),axes=F,border=F)
  text(x=-0.1,y=0.5,adj=1,label=names(clist)[i],xpd=T,cex=1.2)}
}

#Start to plot the graph
sfiles <- list.files(path="/input/", pattern="inputFiles.*.Q$", full.names=T)

slist <- readQ(sfiles)

pop <- read.table("populaiton.pop", header=F,stringsAsFactors=F)
onelabset <- pop[,2,drop=FALSE]
colnames(onelabset) <- c("pop")

#sort by the population group
p2 <-plotQ(slist[c(8,9,10,11,12,13,14,15,2,3,4,5,6,7)],clustercol=clist$shiny,imgoutput="join",grplab=onelabset,returnplot=T,exportplot=F,basesize=11,grplabsize=3.5,pointsize=6,linesize=7,linealpha=0.2,pointcol="white",grplabpos=0.5,linepos=0.5,grplabheight=0.75,ordergrp=TRUE,subsetgrp=c("JPT","CHB","CHS","HKG","CDX","KHV","GIH","ITU","PJL","BEB","STU"))
grid.arrange(p2$plot[[1]])

#k=2
p1 <-plotQ(slist[8],clustercol=clist$shiny,grplab=onelabset,returnplot=T,exportplot=F,basesize=11,grplabsize=3.5,pointsize=6,linesize=7,linealpha=0.2,pointcol="white",grplabpos=0.5,linepos=0.5,grplabheight=0.75,selgrp="pop",sortind="Cluster1",sharedindlab=F,ordergrp=T,subsetgrp=c("JPT","CHB","CHS","HKG","CDX","KHV","GIH","ITU","PJL","BEB","STU"),showgrplab=F)
#k=3
p2 <-plotQ(slist[9],clustercol=clist$shiny,grplab=onelabset,returnplot=T,exportplot=F,basesize=11,grplabsize=3.5,pointsize=6,linesize=7,linealpha=0.2,pointcol="white",grplabpos=0.5,linepos=0.5,grplabheight=0.75,selgrp="pop",sortind="Cluster3",sharedindlab=F,ordergrp=TRUE,subsetgrp=c("JPT","CHB","CHS","HKG","CDX","KHV","GIH","ITU","PJL","BEB","STU"),showgrplab=F)

grid.arrange(p1$plot[[1]],p2$plot[[1]],nrow=2)