#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=32G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_AB_maleref/wasp/wdir

source /usr/local/extras/Genomics/.bashrc


hisat2-build $1 index -p 16
mkdir /fastdata/bop20pp/supergene_AB_maleref/wasp/hisat_index
mv index*ht2 /fastdata/bop20pp/supergene_AB_maleref/wasp/hisat_index
