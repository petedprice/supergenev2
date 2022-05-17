#!/bin/bash

#$ -l h_rt=2:0:0

#$ -l rmem=16G

#$ -pe smp 4

#$ -P ressexcon
#$ -q ressexcon.q

#$ -wd /fastdata/bop20pp/supergene_AB_maleref/phaser/wdir

module load apps/python/anaconda3-4.2.0
source activate phaser

mkdir /fastdata/bop20pp/supergene_AB_maleref/phaser/$2/ASE

python ~/software/phaser/phaser_gene_ae/phaser_gene_ae.py \
	--haplotypic_counts /fastdata/bop20pp/supergene_AB_maleref/phaser/$2/${1}_${2}_phaser.haplotypic_counts.txt \
	--features  /fastdata/bop20pp/supergene_AB_maleref/phaser/beds/${1}.bed \
	--o /fastdata/bop20pp/supergene_AB_maleref/phaser/$2/ASE/${1}_${2}.phaserASE.txt \
	--id_separator +
