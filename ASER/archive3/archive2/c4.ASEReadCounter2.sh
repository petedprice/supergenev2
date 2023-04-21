#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

module load apps/python/anaconda3-4.2.0

out=${1#"/fastdata/bop20pp/supergene_wogtf/ASEReadCounter/"}
out2=${out%".merged.genotyped_filtered.recode.vcf"}
out2=${out2%".genotyped_filtered.recode.vcf"}
out3=${out2#"CM020861.1_tgu_Sample_"}

source activate gatk

mkdir /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/ASER_counts
gatk \
	IndexFeatureFile \
	-I $1

gatk \
	ASEReadCounter \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-I /fastdata/bop20pp/supergene_wogtf/bam/tgu_Sample*${out3}*md.RG.bam \
	-V  $1 \
	-O /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/$out2.ASER.counts
