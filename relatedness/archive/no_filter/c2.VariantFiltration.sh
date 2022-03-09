#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=32G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/relatedness/wdir

source /usr/local/extras/Genomics/.bashrc

tabix -p vcf $1

out=${1%".vcf.gz"}
echo $out

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	VariantFiltration \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	-V $1 \
	-O ${out}_temp_filtered.vcf.gz \
	--filter-expression "QUAL < 30.0" \
	--filter-name "FAIL1" \
        --filter-expression "DP < 10" \
        --filter-name "FAIL2"

java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
        -Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
        -jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	SelectVariants \
	-V ${out}_temp_filtered.vcf.gz \
	--set-filtered-gt-to-nocall \
	-O ${out}_filtered.vcf.gz


#bcftools view -f PASS ${out}_temp_filtered.vcf > ${out}_filtered.vcf
#mv ${out}_temp_filtered.vcf ${out}_filtered.vcf
${out}_temp_filtered.vcf*
tabix -f -p vcf ${out}_filtered.vcf.gz
