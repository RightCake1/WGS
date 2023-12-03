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
sudo apt-get install fastqc
fastqc new_R1.fastq
fastqc new_R2.fastq

# Step 6: Run Trimmomatic for Sequence Trimming
java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 new_R1.fastq new_R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36

# Step 7: Run FastQC Again
fastqc R1p.fastq R2p.fastq 

