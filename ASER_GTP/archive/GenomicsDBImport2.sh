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
	--sample-name-map /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/sample.map \
	--genomicsdb-workspace-path /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/my_database \
	--tmp-dir=//fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tmp \
	-L CM020861.1

rm -r /fastdata/bop20pp/supergene_wogtf/gvcfs/save/clus/tmp

