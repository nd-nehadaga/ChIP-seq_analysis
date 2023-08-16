#!/bin/bash

###### Example case

#input_bam_dir="/scratch/daga/BAM_s_dups_chr_rm_mapped_qs"
#output_mac2_dir="/scratch/daga/"
#input_control="/scratch/daga/BAM_s_dups_chr_rm_mapped_qs/EP15-INPUT.bam"
#file_pattern="*H3K27ac_*bam"

###### Arguments to be provided
input_bam_dir=$1
output_mac2_dir=$2
input_control=$3
file_pattern=$4


for bam in $(find $input_bam_dir -name $file_pattern);do

base=$(basename $bam)
output_mac2_dir_base=${output_mac2_dir}${base}_macs

#echo $output_mac2_dir_base				
######### TAKING ONLY TREATMENT AND CONTROL FILES

sbatch -J JOB_NAME_${base}_macs --export=bam_t=$bam,bam_c=$input_control,label=$base,output_mac2_dir_base=$output_mac2_dir_base sbatch_mac2_se.sh 	
												

done
