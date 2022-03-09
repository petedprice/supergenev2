library(dplyr)
args = commandArgs(trailingOnly=TRUE)

metadata <- read.table(args[1], sep = ",", header = TRUE) 

wdir <- args[2]
dir.create(paste(wdir, "/rmats", sep = ""))
dir.create(paste(wdir, "/rmats/wdir", sep = ""))
s="tgu"
print(s)
dir.create(paste(wdir, "/rmats/", s, sep = ""))
dir.create(paste(wdir, "/rmats/", s, "sg", sep = ""))
ss <-metadata[which(metadata$sex == "F"),]
path_B <- c()
for (i in ss$code[ss$genotype == "B_genotypes"]){
  temp_path <- paste(wdir, "/hisat_allign/", s, "_", i, ".bam", sep = "")
  path_B <- c(path_B, temp_path)
} 
available <- gsub("//", "/", Sys.glob(paste(wdir, "/hisat_allign/*", sep = "")))
path_B <- path_B[gsub("//", "/",path_B) %in% available]
fileConn<-file(paste(wdir, "/rmats/",  s, "_B_path.txt", sep = ""))
writeLines(paste(path_B, collapse = ","), fileConn)
close(fileConn)
  
path_A <- c()
for (i in ss$code[ss$genotype == "A_genotypes"]){
  temp_path <- paste(wdir, "/hisat_allign/", s, "_", i, ".bam", sep = "")
  path_A <- c(path_A, temp_path)
 }
available <- gsub("//", "/",Sys.glob(paste(wdir, "/hisat_allign/*", sep = "")))
path_A <- path_A[gsub("//", "/",path_A) %in% available]
fileConn<-file(paste(wdir,  "/rmats/",s, "_A_path.txt", sep = ""))
writeLines(paste(path_A, collapse = ","), fileConn)
close(fileConn)
                 
fileConn<-file(paste("rmats_", s, ".sh", sep = ""))
writeLines(c("#!/bin/bash", "",
               "#$ -l h_rt=5:0:0", "",
               "#$ -l rmem=4G",  "",
               "#$ -pe smp 4",  "",
               paste("#$ -wd /", wdir, "/rmats/wdir", sep = ""), "",
	       "source /usr/local/extras/Genomics/.bashrc", "",
	       "module load libs/lapack/3.4.2-5/binary", "",
	       "module load libs/gsl/2.4/gcc-6.2", "",
	       "module load apps/python/anaconda2-4.2.0", "",
	       "module load libs/blas/3.4.2-5/binary", "",
	       "conda activate rmats", "",
               paste("python ~/software/rMATS.4.0.3beta/rMATS-turbo-Linux-UCS4/rmats.py --b1 ", wdir, "/rmats/", s, "_A_path.txt --b2 ", wdir, "/rmats/", s, "_B_path.txt --gtf ", wdir, "/gtf/", s, ".gtf -t paired --readLength 100 --od ", wdir, "/rmats/", s, "sg",
                     sep = "")
               ), fileConn)
close(fileConn)
  




