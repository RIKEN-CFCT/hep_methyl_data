#===================================================================================================

#libraries

#===================================================================================================
#basic
library("dplyr")
library("tidyverse")
library("magrittr")
library("reshape2")
library("data.table")

#genomic data
library("GenomicRanges")
library("genomation")
library("genefilter")
library("BSgenome.Hsapiens.UCSC.hg19")
library("rtracklayer")
library("Biostrings")
library("GenomeInfoDb")

#methylation array
library("InfiniumDiffMetMotR")

#ATAC
library("TCseq")
library("edgeR")
library("csaw")
library("cluster")

#motif analusis
library("rGADEM")
library("MotIV")

#GREAT
library("rGREAT")

#plot basic
library("ggplot2")
library("circlize")
library("RColorBrewer")
library("ggsci")
library("cowplot")
library("ggpubr")
library("gridExtra")

#upset plot
library("UpSetR")

#heatmap
library("ComplexHeatmap")
library("EnrichedHeatmap")

#ven's diagram
library("venneuler")
library("regioneR")

#QC
library("factoextra")
library("FactoMineR")
library("scatterplot3d")
library("idr")

#CAGE
library("TCseq")
library("enrichR")
#===================================================================================================

#R scripts

#===================================================================================================
source("./src/R/function.r")

#===================================================================================================

#marker gene list

#===================================================================================================
#extraction of GOI
psc_marker <- c("POU5F1", "NANOG")
ps_marker <- c("T", "GSC", "EOMES")
de_marker <- c("SOX17",  "FOXA2", "GATA6")
hblast_marker <- c("HNF1B","HNF4A", "PROX1", "ONECUT1")
hep_marker <- c("ASGR1", "APOB", "SLC10A1","AFP", "ALB", "PAX6", "PPARA", "CYP3A4", "CYP2C19", "CYP2E1")
early_hep_marker <-  c("TBX3", "HNF4A", "HNF6","AFP")
hep_maturation_marker <- c("SERPINA1", "PROX1", "KRT18","ALB")
drug_transporter <- c("SLC10A1", "ABCC2", "SLCO1B1", "ABCB11")
p450 <- c("CYP1A1", "CYP1A2", "CYP2A6", "CYP2B6", "CYP2C8", "CYP2C9", "CYP2C19", "CYP2D6", "CYP2E1", "CYP3A4", "CYP3A5")
methylation_genes <- c("DNMT1", "DNMT3A", "DNMT3B", "TET1", "TET2", "TET3")
cardio_marker <- c("NKX2-5", "MYH6", "MYH7", "TNNI3", "MYL3")
pancreatic_marker <- c("NKX2-2", "NKX6-1", "NEUROD1", "MAFA", "MAFB", "PDX1")
set1 <- c("CYP1A1","CYP1A2","CYP2C9", "CYP3A4", "CYP3A5", "CYP3A7", "GSTA1", "UGT2B7", "SLC10A1", "SLCO1B1")
set2 <- c("SERPINA1", "KRT18")
set3 <- c("HNF1B", "HNF4A","ASGR1","APOB", "SLC10A", "AFP", "PPARA", "KRT18", "SERPINA1", "ALB", "CYP3A4", "CYP1A1")
cholandiocyte_marker <- c("SOX9", "SOX4", "SPP1", "EPCAM", "TGFBR2", "ITGB4")

#--------------------------
#Raggi et al. Stem Cell Reports(2022)
#--------------------------
#DE: EOMES. FOXA2, SOX17, CXCR4, EOMES, GATA4, HHEX, HNF1B
#VPFG: HHEX, PROX1, HNF4A, AFP, ALB
#LB(hepatoblast): HNF4A, PROX1, AFP-keep, ALB-keep, HNF1B-down, SOX9-up, MKI67 (proliferation)
#HLC: ALB, AFP, ASGR1, TAT
#NR1H3. NR1I3 up LB, down HLC; NR1I2 down HLC 

#--------------------------
#Ghosheh and Synnergren et al. Stem Cell International (Takara) (2016)
#--------------------------

#ONECUT1(HNF6)


#==============================================================================================#

# ggplot theme

#==============================================================================================#
my.theme <- theme(
    panel.background = element_blank(),
    panel.border = element_rect(fill = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    strip.background = element_blank(),
    text = element_text(colour = "black", size = 15),
    #axis.text.x = element_text(colour = "black", size = 15),
    #axis.text.y = element_text(colour = "black", size = 15),
    axis.ticks = element_line(colour = "black", size = 1),
    #legend.title = element_text(colour = "black", size = 15), 
    plot.margin = unit(c(1, 1, 1, 1), "line"),
    plot.title = element_text(hjust = 0.5, size = 15)
)