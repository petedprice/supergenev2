#!/bin/bash

#$ -l h_rt=1:0:0

#$ -l rmem=16G

#$ -pe smp 4

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

source /usr/local/extras/Genomics/.bashrc

out=${1%".merged.genotyped_filtered.recode.vcf"}
out2=${out#"/fastdata/bop20pp/supergene_wogtf/ASEReadCounter/"}
echo $out

rm temp_chrs_bams.txt
touch temp_chrs_bams.txt

for c in $(cat $2)
do
echo -n /fastdata/bop20pp/supergene_wogtf/bam/${c}*${out2}*bam \ >> ${out2}_temp_chrs_bams.txt
done

rm ${out}.autosomes.bam
samtools merge -f ${out}.autosomes.bam $(cat ${out2}_temp_chrs_bams.txt)
samtools index ${out}.autosomes.bam
