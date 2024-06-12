library("DiffBind")
library("DESeq2")
library("ggplot2")




######### Input Data
metadata = read.table("/path/for_inputfile_with/metainformation",header = T,sep = "\t")
### read the raw read count file generated from "DiffBind" from step 3
JIA_raw_count = "/outputfile/with/rawreadcounts/"
design_matrix = ~ Age_group + Gender + Batch + Condition

######### Construction of dds object
dds = DESeqDataSetFromMatrix(countData = JIA_raw_count,
                             colData = metadata, 
                             design = design_matrix)



##### Create rld object for visualization
dds = estimateSizeFactors(dds)
rld <- rlogTransformation(dds, blind=TRUE)

########## Plotting PCA to check the condition
plotPCA(rld, intgroup = "Condition", ntop = 500, returnData = FALSE)


### Differential analysis
## Filter 
idx <- rowSums(counts(dds) > 0) >= 10
dds = dds[idx,]

dds <- DESeq(dds)
res <- results(dds)
summary(res)

############ Diagnostic Plots
###### SHrinkage 
resultsNames(dds)
resLFC <- lfcShrink(dds, coef="Condition_Patient_vs_Healthy", type="apeglm")
resNorm <- lfcShrink(dds, coef="Condition_Patient_vs_Healthy", type="normal")

####1 . MA plot
par(mfrow=c(1,3))
xlim <- c(1,1e5); ylim <- c(-1,1)
plotMA(res, xlim=xlim, ylim=ylim, main="DESeq2")
plotMA(resLFC, xlim=xlim, ylim=ylim, main="apeglm")
plotMA(resNorm, xlim=xlim, ylim=ylim, main="normal")

## 2. Distribution of pvalue 
hist(res$pvalue, col="grey")

#### Writing to a file 
resOrdered_df <- data.frame(res[order(res$padj),])
resOrdered_df$peak_id = rownames(resOrdered_df)

write.table(x = resOrdered_df,file = "/outfile_path_for/diff_peak_analysis_result.txt",
            quote = F,sep = "\t",row.names = F,col.names = TRUE)






