#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 8

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/wdir

source /usr/local/extras/Genomics/.bashrc

rm /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/${1}.list

for c in $(cat $2)
do
ls /fastdata/bop20pp/supergene_wogtf/gvcfs/${c}*${1}*vcf.gz >> /fastdata/bop20pp/supergene_wogtf/ASEReadCounter/${1}.list
done

picard GatherVcfs I=/fastdata/bop20pp/supergene_wogtf/ASEReadCounter/${1}.list O=/fastdata/bop20pp/supergene_wogtf/ASEReadCounter/${1}.merged.vcf.gz
