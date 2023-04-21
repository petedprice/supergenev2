#!/bin/bash

#$ -l h_rt=4:0:0

#$ -l rmem=8G

#$ -pe smp 1

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts

source /usr/local/extras/Genomics/.bashrc

out=${1#"/fastdata/bop20pp/supergene_wogtf/bam/"}
out=${out%".bam"}
echo $out

for i in /home/bop20pp/software/supergene_wogtf/check_coverage_at_ASE/bed/*
do
echo $i
samtools depth -b $i $1  |  awk '{sum+=$3} END { print $1 ,sum/NR}' >> ${out}_depths.csv
done
