out=${1#"/fastdata/bop20pp/supergene_wogtf/gvcfs/CM020861.1_"}
out=${out%".g.vcf.gz"}
echo $out

echo $out > /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/${out}_reheader.txt

bcftools reheader \
	-s /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/${out}_reheader.txt \
	-o /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_${out}.rh.g.vcf.gz $1
