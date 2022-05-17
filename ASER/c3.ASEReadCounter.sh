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
	IndexFeatureFile \
	-F /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/vcfs/${1}*${2}*recode.vcf

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	ASEReadCounter \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-I /fastdata/bop20pp/supergene_wogtf/bam/${1}*${2}*bam \
	-V /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/vcfs/${1}*${2}*recode.vcf \
	-O /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/ASER_counts/${1}_${2}.ASER.counts
