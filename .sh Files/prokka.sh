#!/bin/bash

# Prokka Source Page
# [Prokka Source Page](https://github.com/tseemann/prokka)

# Step 1: Create Environment
conda create -c bioconda -n prokka prokka

# Step 2: Activate Prokka Environment
conda activate prokka

# Step 3: Run Prokka on Fasta File
prokka file_name.fasta
