#!/bin/bash
#$ -P ressexcon
#$ -q ressexcon.q

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts/wdir

source /usr/local/extras/Genomics/.bashrc
source activate subread

out=${2%".bam"}
echo $out

for i in $(cat $1)
do
samtools depth $2 |  grep  $i >> ${out}_samtoolsdepth.out
done
