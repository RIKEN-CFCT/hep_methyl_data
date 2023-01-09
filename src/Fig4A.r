library("ggplot2")

# create directories
dir.create(paste0("./out/", run_id))
dir.create(paste0("./data/", run_id))
out_dir <- paste0("./out/", run_id, "/")
data_dir <- paste0("./data/", run_id, "/")

#load utilities
source("./src/R/util.r")
source("./src/R/peakreference2.R")

#===================================================================================================#

## barplot of peak count

#===================================================================================================#
files <- ("GSE163330_GATA6_0h_summits.bed",
    "GSE163330_GATA6_48h_summits.bed",
    "GSE163330_GATA6_54h_summits.bed",
    "GSE163330_GATA6_60h_summits.bed",
    "GSE163330_GATA6_66h_summits.bed",
    "GSE163330_GATA6_72h_summits.bed")
peak_list <- NULL
for(i in 1:length(files)){
    peak <- read.table(files[i])
    peak_list <- c(peak_list, list(peak))
}
npeaks <- sapply(peak_list, nrow)
names(npeaks) <- c("0 h", "48 h", "54 h", "60 h", "66 h",  "72 h")

peaks_df <- data.frame(time = names(npeaks), peak_count = npeaks)

my.theme <- theme(
    panel.background = element_blank(),
    panel.border = element_rect(fill = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    strip.background = element_blank(),
    text = element_text(colour = "black", size = 15),
    axis.ticks = element_line(colour = "black", size = 1),
    plot.margin = unit(c(1, 1, 1, 1), "line"),
    plot.title = element_text(hjust = 0.5, size = 15)
)
g <- ggplot(peaks_df, aes(x = time, y = peak_count))
g <- g + geom_bar(stat = "identity")
g <- g + my.theme
g