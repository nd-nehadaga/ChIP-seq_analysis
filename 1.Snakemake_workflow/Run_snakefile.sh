#!/bin/bash

snakemake -s snakemake_chIP --nolock --reason --configfile config.json --latency-wait 120 --notemp --rerun-incomplete  --cores 16 --keep-going --stats /scratch/daga/Psoriasis_SLE/Psoriasis_SLE_all_batches/Psoriasis_SLE_seq_all_rounds_last/Logs_and_Benchmarks --jobs 400 --cluster-config cluster.json --cluster "sbatch -p {cluster.queueSLURM} -J {cluster.name} -A {cluster.group} --cpus-per-task {cluster.nCPUs} --mem {cluster.memory} --time {cluster.maxTime} -o "{cluster.output}" -e "{cluster.error}" --mail-type=FAIL" --local-cores 1


#snakemake -s snakemake_chIP --forceall --dag | dot -Tpng > dag1.png
