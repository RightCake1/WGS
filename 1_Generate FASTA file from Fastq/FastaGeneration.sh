#!/bin/bash

# Step 1: Get Fastq Sequence

# Step 2: Unzip
gunzip *.gz

# Step 3: Rename Files for Convenience
mv original_R1.fastq.gz new_R1.fastq.gz
mv original_R2.fastq.gz new_R2.fastq.gz

# Step 4: Merge Files into One Fastq File
cat new_R1.fastq.gz > new_R1.fastq
cat new_R2.fastq.gz > new_R2.fastq

# Step 5: Run FastQC on the 2 Merged Files
fastqc new_R1.fastq
fastqc new_R2.fastq

# Check the reports. If red flags are observed, trimming may be necessary.
