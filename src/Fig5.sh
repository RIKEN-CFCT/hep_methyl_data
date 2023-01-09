#===================================================================================================#

# ATAC_DE
#	ngs plots

#===================================================================================================#
#file list
files=`find ./data/ -name ATAC_DE_*filt.narrowPeak -type f`

for i in $files;do
    time=`echo $i|sed -e 's/\.\/data\/ATAC_DE_//g'|sed -e 's/_peaks\.filt\.narrowPeak//g'`
    echo  $i '"'${time}'"' >> atac_ngsplot_list.txt
done
#ngsplot
ngs.plot.r -G hg19 -R genebody -C atac_ngsplot_list.txt -O atac_tss_ngsplot -T ATACseq_reads -L 3000 -FL 300

