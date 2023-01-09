library("GenomicRanges")
library("IRanges")
library("Biostrings")
library("GenomeInfoDb")
library("BSgenome.Hsapiens.UCSC.hg19")
library("rGADEM")
library("MotIV")

IMAGE_PWMlist <- readRDS("./data/IMAGE_PWMlist.obj")

files <- c("data/GATA6_54h_peaks.filt.narrowPeak",
	"data/GATA6_60h_peaks.filt.narrowPeak",
	"data/GATA6_66h_peaks.filt.narrowPeak",
	"data/GATA6_72h_peaks.filt.narrowPeak")

#====================================================================
#
# de novo motif analysis
#
#====================================================================
for(infile in files){
	# bed to GRanges object
	peaks <- read.table(infile, header = FALSE)
	header <- c('chr','start','end','id','score','strand')
	names(df) <- header[1:length(names(df))]
	df <- peaks[,-c(7:length(peaks))]
	df$strand <- gsub(pattern="[^+-]", replacement = '*', x = df$strand)
	peaks.gr <- with(df, GRanges(chr, IRanges(start, end), id=id, score=score, strand=strand))

	#sequence extraction
	genome <- BSgenome.Hsapiens.UCSC.hg19
	peaks.seq <- getSeq(x = genome, names = peaks.gr)

	#de novo motif identification
	peaks.motif <- GADEM(peaks.seq, verbose = 1, genome = Hsapiens)
	peaks.motif.pwms <- getPWM(peaks.motif)
	IMAGE.pwms <- IMAGE_PWMlist
	IMAGE.scores <- readDBScores(file = "./data/IMAGE.scores.RData")
	peaks.IMAGE <- motifMatch(
		inputPWM = peaks.motif.pwms, 
		align = "SWU", 
		cc = "PCC", 
		database = IMAGE.pwms, 
		DBscores = IMAGE.scores, 
		top = 3
	)

	#pdf output
	out_prefix <- gsub("\.filt\.narrowPeak", "",
		gsub("data\/", "", infile))
	pdffile <- paste0(out_prefix, ".pdf")
	main <- out_prefix
	pdf(pdffile, width = 7, height = 21)
	plot(peaks.IMAGE, ncol = 2, top = 5, rev = FALSE, main = main, bysim = TRUE)
	dev.off()
}


