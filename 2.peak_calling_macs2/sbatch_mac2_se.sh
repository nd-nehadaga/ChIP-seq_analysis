#!/bin/bash

#SBATCH -A zaugg
#SBATCH --mem 15000
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o slurm.%N.%j.out
#SBATCH -e slurm.%N.%j.err
#SBATCH --mail-type=END,FAIL


source activate py27

macs2 callpeak -t ${bam_t} -c ${bam_c} -f BAM -g hs -n ${label} -B --keep-dup all --outdir ${output_mac2_dir_base}

source deactivate



