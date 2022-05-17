

#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/wdir

source /usr/local/extras/Genomics/.bashrc
mkdir /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/
mkdir /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/tmp

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	CombineGVCFs \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_10-15.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_1-3.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_2-4.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_3-6.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_4-8.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_5-9.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_6-11.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_7-12.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_8-13.rh.g.vcf.gz -V /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_9-14.rh.g.vcf.gz \
	-O /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/Z_combine.g.vcf \
	--tmp-dir=//fastdata/bop20pp/supergene_wogtf/gvcfs/combine/tmp


