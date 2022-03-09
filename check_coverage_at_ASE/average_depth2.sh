#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 1

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts

source /usr/local/extras/Genomics/.bashrc

source /usr/local/extras/Genomics/.bashrc
source activate subread

out=${1%".bam"}
echo $out

samtools depth  $1 > ${out}_depths.csv
