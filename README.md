# A dataset of definitive endoderm and hepatocyte differentiations from human induced pluripotent stem cell
Author: Takahiro Suzuki

lastpudate: 2023-01-09

---
Analysis scripts used for Yuki Tanaka et al. "A dataset of definitive endoderm and hepatocyte differentiations from human induced pluripotent stem cell"
DOI:

### data
peak data of omni-ATAC-seq and GATA6 ChIPmentation.Peak calling was performed using MACS2 (version 2.1.1.20160309) with a cut-off p-value < 10-6.
- ATAC_DE_0h_peaks.filt.narrowPeak
- ATAC_DE_48h_peaks.filt.narrowPeak
- ATAC_DE_54h_peaks.filt.narrowPeak
- ATAC_DE_66h_peaks.filt.narrowPeak
- ATAC_DE_72h_peaks.filt.narrowPeak
- GATA6__0h_peaks.filt.narrowPeak
- GATA6__48h_peaks.filt.narrowPeak
- GATA6__54h_peaks.filt.narrowPeak
- GATA6__66h_peaks.filt.narrowPeak
- GATA6__72h_peaks.filt.narrowPeak

### src
analysis scripts for each figure
- Fig2.r
- Fig3.r
- Fig4A.r
- Fig4B.r
- Fig5sh
- QC.sh
