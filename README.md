#H3K27ac ChIP-seq Data analysis

There are 4 folders/files and the workflow is sequential from processing ChIP-seq data and subsequently identifying diffpeaks

 1. Snakemake_workflow : Consit of worflow for processing raw sequencing files from fastq-filtered bam files
 2. peak_calling_macs2 : This contains scripts for batch calling macs2 
 3. diffBind_consensus_peakset_raw_count.R : It is used for generating consensus peakset and raw counts
 4. diffpeak_analysis.R: Done using DESeq2
