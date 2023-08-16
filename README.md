H3K27ac ChIP-seq Data analysis
 It consit of 4 steps as numbered.

 1. Snakemake workflow : Consit of worflow for processing raw sequencing files from fastq-filtered bam files
 2. Peak calling : This done using macs2
 3. Generating consensus peakset and raw counts : Done using diffBind
 4. Differential peak analysis: Done using DESeq2
