###################################################
### code chunk number 1: sva.Rnw:5-6
###################################################
options(width=65)


###################################################
### code chunk number 3: input
###################################################
library(sva)
library(bladderbatch)
#data(bladderdata)
library(pamr)
library(limma)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

###################################################
### code chunk number 4: input
###################################################
#pheno = pData(bladderEset)
pheno = read.csv(paste(pfix, parameters["pheno", 2], sep="/"))
edata = as.matrix(read.csv(paste(pfix, parameters["edata", 2], sep="/")))
modcombat = model.matrix(~1, data=pheno)
combat_edata = ComBat(dat=edata, batch=pheno$batch, mod=modcombat, par.prior=TRUE, prior.plots=FALSE)

write.csv(combat_edata, outputfile)
}
