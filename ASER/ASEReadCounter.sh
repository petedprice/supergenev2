#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_AB_maleref/ASER/wdir

source /usr/local/extras/Genomics/.bashrc

#java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
#        -Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
#        -jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
#	IndexFeatureFile \
#	-F /fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/${1}_tgu_Sample_${2}.genotyped.vcf.gz



java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	ASEReadCounter \
	-R /fastdata/bop20pp/supergene_AB_maleref/GCF_003957565.2_bTaeGut1.4.pri_genomic.fna \
	-I /fastdata/bop20pp/supergene_AB_maleref/bam/${1}_tgu_Sample_${2}_md_cig.RG.bam \
	-V /fastdata/bop20pp/supergene_AB_maleref/filtered_genotyped_vcfs/${1}_tgu_Sample_${2}_filtered.recode.vcf.gz \
	-O /fastdata/bop20pp/supergene_AB_maleref/ASER/counts/${1}_${2}.ASER.counts
