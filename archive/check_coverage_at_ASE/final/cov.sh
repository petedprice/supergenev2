#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts/wdir

source /usr/local/extras/Genomics/.bashrc
source activate subread

out=${2%".bam"}
echo $out

bedtools coverage -a $1 -b $2 -d > ${out}_ASE_cov.table
