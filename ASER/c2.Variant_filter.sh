#!/bin/bash

#$ -l h_rt=1:0:0

#$ -l rmem=16G

#$ -pe smp 4

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

source /usr/local/extras/Genomics/.bashrc

out=${1%".g.vcf"}
echo $out

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 -jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar VariantFiltration \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-V $1 \
	-O ${1}.tempclus \
	-cluster 10 \
	-window 145


bcftools view -f PASS $1.tempclus > $1.tempclus.filt

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	SelectVariants \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-V $1.tempclus.filt \
	--restrict-alleles-to BIALLELIC \
	--select-type-to-include SNP \
	-O $1.tempclus.filt.ba


vcftools --vcf $1.tempclus.filt.ba --out ${out}_filtered --minGQ 30 --minDP 10 --recode --recode-INFO-all

rm ${1}*temp*
