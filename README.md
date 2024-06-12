#### H3K27ac ChIP-seq Data analysis

There are 4 folders/files and these are sequentially executed. They are used for processing ChIP-seq data and for subsequently identifying differential peaks

 1. Snakemake_workflow: Workflow used for processing raw sequencing files from fastq to filtered bam files
 2. peak_calling_macs2: This folder contains scripts for calling peaks using macs2 in a batch mode
 3. diffBind_consensus_peakset_raw_count.R: This is used for generating consensus peakset and raw counts using diffBind
 4. diffpeak_analysis.R: This is used to perform differential peak analysis between conditions using DESeq2
