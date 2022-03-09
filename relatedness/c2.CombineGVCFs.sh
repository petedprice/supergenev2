#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/relatedness/wdir

source /usr/local/extras/Genomics/.bashrc

rm /fastdata/bop20pp/supergene_wogtf/relatedness/unfilt_merged_vcfs.list

for s in /fastdata/bop20pp/supergene_wogtf/relatedness/*.merged.vcf.gz
do
out=${s#"/fastdata/bop20pp/supergene_wogtf/relatedness/"}
out2=${out%".vcf.gz"}
echo $out2
echo $out2 > /fastdata/bop20pp/supergene_wogtf/relatedness/${out2}_reheader.txt

bcftools reheader \
	-s /fastdata/bop20pp/supergene_wogtf/relatedness/${out2}_reheader.txt \
	-o /fastdata/bop20pp/supergene_wogtf/relatedness/${out2}.rh.vcf.gz $s


echo /fastdata/bop20pp/supergene_wogtf/relatedness/${out2}.rh.vcf.gz >> /fastdata/bop20pp/supergene_wogtf/relatedness/merged_vcfs.list
#echo $s >> /fastdata/bop20pp/supergene_wogtf/relatedness/merged_vcfs.list
tabix -p vcf /fastdata/bop20pp/supergene_wogtf/relatedness/${out2}.rh.vcf.gz
done


java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true \
	-Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 \
	-jar /usr/local/community/Genomics/apps/gatk/4.1.0.0/gatk-package-4.1.0.0-local.jar \
	CombineGVCFs \
	-R /fastdata/bop20pp/supergene_wogtf/GCA_009859065.2_bTaeGut2.pri.v2_genomic.fasta \
	--variant /fastdata/bop20pp/supergene_wogtf/relatedness/merged_vcfs.list \
	-O /fastdata/bop20pp/supergene_wogtf/relatedness/TGU_males_shared_autosomes_combine.g.vcf.gz \
	--tmp-dir=//fastdata/bop20pp/supergene_wogtf/relatedness/wdir


