#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_AB_maleref/wasp/wdir

source /usr/local/extras/Genomics/.bashrc


hisat2-build $3 index -p 16
mkdir hisat_index
mv index*ht2 hisat_index


hisat2 \
	-x hisat_index \
	-1 $1 \
	-2 $2 \
        --summary-file ${sid}_hisat2.summary.log \
        --threads 16 \
            | samtools view -bS -F 4 -F 8 -F 256 - > out.bam
