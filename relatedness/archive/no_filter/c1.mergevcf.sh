#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/relatedness/wdir

source /usr/local/extras/Genomics/.bashrc

for c in $(cat $2)
do
ls /fastdata/bop20pp/supergene_wogtf/gvcfs/${c}*${1}*vcf.gz >> /fastdata/bop20pp/supergene_wogtf/relatedness/${1}.list
done

#/fastdata/bop20pp/supergene_wogtf/relatedness/${1}.list
#for s in /fastdata/bop20pp/supergene_wogtf/gvcfs/*$1*
#do
#if [ ${s%_tgu*.gz} != '/fastdata/bop20pp/supergene_wogtf/gvcfs/CM020861.1' ]
#then
#	echo $s >> /fastdata/bop20pp/supergene_wogtf/gvcfs/merged_vcfs/$1.list
#fi
#done


picard GatherVcfs I=/fastdata/bop20pp/supergene_wogtf/relatedness/${1}.list O=/fastdata/bop20pp/supergene_wogtf/relatedness/${1}.merged.vcf.gz
