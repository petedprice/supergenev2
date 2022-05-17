rm gvcf.paths
for i in /fastdata/bop20pp/supergene_wogtf/gvcfs/combine/CM020861.1_tgu_Sample_*vcf.gz ; do  echo -n "-V $i ">> gvcf.paths; done
echo -n \\ >> gvcf.paths
