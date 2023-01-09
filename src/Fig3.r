library("FactoMineR")
library("factoextra")
library("ggplot2")

#===================================================================================================#

# CAGE HEP

#===================================================================================================#
#loding the CAGE expression data
expMatrix <- read.table("GSE163329_iPS_HEP_diff_F5.TPM.txt", 
    header = TRUE, 
    row.name = NULL, 
    sep = "\t",
    stringsAsFactors = FALSE)

rownames(expMatrix) <- expMatrix[,1]
expMatrix <- expMatrix[,-1]
            
#PCA
df <- t(expMatrix)
res.pca <- PCA(df,  graph = FALSE)

g_pca <- fviz_pca_ind(
    res.pca,
    axes = c(1, 2),
    pointsize = 3,
    invisible="quali", 
    palette = "npg",
    repel = TRUE,
    max.overlaps = Inf
)
g_pca <- g_pca + theme(legend.position = 'none')
g_pca

#===================================================================================================#

# CAGE DE

#===================================================================================================#
#loding the CAGE expression data
expMatrix <- read.table("GSE163328_iPS_DE_diff_F5.TPM_geo.txt", 
    header = TRUE, 
    row.name = NULL, 
    sep = "\t",
    stringsAsFactors = FALSE)

rownames(expMatrix) <- expMatrix[,1]
expMatrix <- expMatrix[,-1]

#PCA
df <- t(expMatrix)
res.pca <- PCA(df,  graph = FALSE)

g_pca <- fviz_pca_ind(
    res.pca,
    axes = c(1, 2),
    pointsize = 3,
    invisible="quali", 
    palette = "npg",
    repel = TRUE,
    max.overlaps = Inf
)
g_pca <- g_pca + theme(legend.position = 'none')
g_pca