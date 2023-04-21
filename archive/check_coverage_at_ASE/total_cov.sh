#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=4G

#$ -pe smp 1

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts

source /usr/local/extras/Genomics/.bashrc
source activate subread

out=${1#"/fastdata/bop20pp/supergene_wogtf/bam/"}
out=${out%".bam"}
echo $out

featureCounts -F SAF -T 1 -a $2 -o ${out}_Zcounts.table $1 
