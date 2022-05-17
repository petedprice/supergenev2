#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

source /usr/local/extras/Genomics/.bashrc
rm -r /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/my_database
mkdir /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tmp

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	GenomicsDBImport \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_10-15.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_1-3.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_2-4.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_3-6.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_4-8.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_5-9.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_6-11.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_7-12.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_8-13.g.clus.vcf \
	-V /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tgu_Sample_9-14.g.clus.vcf \
	--genomicsdb-workspace-path /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/my_database \
	--tmp-dir=//fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tmp \
	-L CM020861.1

rm -r /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tmp

