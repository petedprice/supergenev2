#!/bin/bash

#$ -P ressexcon
#$ -q ressexcon.q

#$ -l h_rt=4:0:0


#$ -l rmem=16G

#$ -pe smp 4

#$ -wd /fastdata/bop20pp/supergene_wogtf/bam/ASE_counts

source /usr/local/extras/Genomics/.bashrc

out=${1#"/fastdata/bop20pp/supergene_wogtf/bam/"}
out=${out%".bam"}
echo $out

bedtools coverage -a $1 -b $2 -mean > $2.bedtools.out
