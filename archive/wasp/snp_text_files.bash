mkdir /fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/$1
mkdir /fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/$1/$2
cp /fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/${2}*${1}.genotyped.vcf.gz /fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/$1/$2

mkdir /fastdata/bop20pp/supergene_AB_maleref/wasp/snp_files/$1/$2


bash /home/bop20pp/software/WASP-master/mapping/extract_vcf_snps.sh \
	/fastdata/bop20pp/supergene_AB_maleref/genotyped_vcfs/$1/$2 \
	/fastdata/bop20pp/supergene_AB_maleref/wasp/snp_files/$1/$2

mv /fastdata/bop20pp/supergene_AB_maleref/wasp/snp_files/$1/$2/.snps.txt.gz \
	/fastdata/bop20pp/supergene_AB_maleref/wasp/snp_files/$1/$2.snps.txt.gz

rm -r /fastdata/bop20pp/supergene_AB_maleref/wasp/snp_files/$1/$2/
