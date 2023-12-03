#!/bin/bash

# SPAdes Command Line Tutorial
# [Tutorial Link](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)
# [SPAdes Source Page](https://github.com/ablab/spades)

# Assembly using Paired Reads
spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto -o spades_assembly

# Reference-Based Assembly
spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto --careful --trusted-contigs Reference.fasta -o spades_assembly_reference_based