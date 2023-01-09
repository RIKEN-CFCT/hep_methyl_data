#You can download the fastq files from GEO/SRA (GSE163331)

# fastQC
#CAGE_HEP (all CAGE_HEP fastq.gz files are in the CAGE_HEP_fastq directory)
mkdir -p fastqc_results/CAGE_HEP/
fastqc -o fastqc_results/CAGE_HEP/ CAGE_HEP_fastq/*.fastq.gz
#CAGE_DE (all CAGE_DE fastq.gz files are in the CAGE_DE_fastq directory)
mkdir -p fastqc_results/CAGE_DE/
fastqc -o fastqc_results/CAGE_DE/ CAGE_DE_fastq/*.fastq.gz
#ChIP_DE_GATA6 (all ChIP_DE_GATA6 fastq.gz files are in the ChIP_DE_GATA6_fastq directory)
mkdir -p fastqc_results/ChIP_DE_GATA6/
fastqc -o fastqc_results/ChIP_DE_GATA6/  ChIP_DE_GATA6_fastq/*.fastq.gz
#ATAC_DE  (all ATAC_DE fastq.gz files are in the ATAC_DE_fastq directory)
mkdir -p fastqc_results/ATAC_DE/
fastqc -o fastqc_results/ATAC_DE/ ATAC_DE_fastq/*.fastq.gz

#MultiQC
multiqc --pdf -o fastqc_results/CAGE_HEP/ fastqc_results/CAGE_HEP/
multiqc --pdf -o fastqc_results/CAGE_DE/ fastqc_results/CAGE_DE/
multiqc --pdf -o fastqc_results/ChIP_DE_GATA6/ fastqc_results/ChIP_DE_GATA6/
multiqc --pdf -o fastqc_results/ATAC_DE/ fastqc_results/ATAC_DE/
