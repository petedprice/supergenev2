OB#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

source /usr/local/extras/Genomics/.bashrc
mkdir /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/ASER_counts
java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	ASEReadCounter \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-I /fastdata/bop20pp/supergene_wogtf/bam/CM020861.1_tgu_${1}_md_cig.RG.bam \
	-V /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/CM020861.1_tgu_${1}.rh.ba.genotyped.g.vcf \
	-O /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/ASER_counts/CM020861.1_tgu_${1}_ASERout.table
