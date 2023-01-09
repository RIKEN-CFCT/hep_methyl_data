# Run QC.sh in advance.

library("tidyverse")
library("ggpubr")
library("ggsci")
library("ggplot2")

#===================================================================================================

# Phred Score

#===================================================================================================
#CAGE_HEP
seq_qual <- read_tsv("fastqc_results/CAGE_HEP/multiqc_data/mqc_fastqc_per_base_sequence_quality_plot_1.txt")
seq_qual$Sample <- gsub("HEP_", "", seq_qual$Sample)
seq_qual$Sample <- gsub("D", "Day", seq_qual$Sample)
seq_qual$Sample <- gsub("Day7", "Day07", seq_qual$Sample)
df <- seq_qual %>%
	pivot_longer(-Sample, names_to = "position", values_to = "average_sequence_score")
ggline(df, x="position", y="average_sequence_score", color = "Sample", 
	ylim=c(0, 45), xlab = "Position(bp)", ylab = "Phred Score") + scale_color_igv()

#CAGE_DE
seq_qual <- read_tsv("fastqc_results/CAGE_DE/multiqc_data/mqc_fastqc_per_base_sequence_quality_plot_1.txt")
df <- seq_qual %>%
	pivot_longer(-Sample, names_to = "position", values_to = "average_sequence_score")
ggline(df, x="position", y="average_sequence_score", color = "Sample", 
	ylim=c(0, 45), xlab = "Position(bp)", ylab = "Phred Score") + scale_color_igv()


#ATAC_DE
seq_qual <- read_tsv("fastqc_results/ATAC_DE/multiqc_data/mqc_fastqc_per_base_sequence_quality_plot_1.txt")
df <- seq_qual %>%
	pivot_longer(-Sample, names_to = "position", values_to = "average_sequence_score")
ggline(df, x="position", y="average_sequence_score", color = "Sample", 
	ylim=c(0, 45), xlab = "Position(bp)", ylab = "Phred Score") + scale_color_igv()

#ChIP_DE_GATA6
seq_qual <- read_tsv("fastqc_results/ChIP_DE_GATA6/multiqc_data/mqc_fastqc_per_base_sequence_quality_plot_1.txt")
seq_qual$Sample <- gsub("qual", "read", seq_qual$Sample)
seq_qual$Sample <- gsub("GATA6_", "", seq_qual$Sample)
df <- seq_qual %>%
	pivot_longer(-Sample, names_to = "position", values_to = "average_sequence_score")
ggline(df, x="position", y="average_sequence_score", color = "Sample", 
	ylim=c(0, 45), xlab = "Position(bp)", ylab = "Phred Score") + scale_color_igv()
