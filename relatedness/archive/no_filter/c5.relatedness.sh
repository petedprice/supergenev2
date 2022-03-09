#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/relatedness/wdir

source /usr/local/extras/Genomics/.bashrc

vcftools --gzvcf $1 \
	--relatedness2
