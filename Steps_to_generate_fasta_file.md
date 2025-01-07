# FASTQ to FASTA Processing Guide

## Introduction
This guide outlines the step-by-step process of handling FASTQ sequence files, performing quality control, and preparing them for downstream analysis. The workflow includes file management, quality assessment, and sequence trimming.

## Prerequisites

```bash
# Install required tools via conda
conda create -n seq_processing
conda activate seq_processing
conda install -c bioconda fastqc trimmomatic

# Verify installations
fastqc --version
trimmomatic -version
```

## Detailed Workflow

### 1. Obtaining FASTQ Sequences

* Download sequences from sequencing facility or public databases
* Common sources:
  * NCBI Sequence Read Archive (SRA)
  * European Nucleotide Archive (ENA)
  * Commercial sequencing providers

### 2. File Decompression

```bash
# For gzip compressed files
gunzip *.fastq.gz

# For zip files
unzip sequence_files.zip

# For tar archives
tar -xvf sequence_files.tar.gz
```

### 3. File Organization and Renaming

```bash
# Create organized directory structure
mkdir -p {raw_data,trimmed,fastqc_reports,final_output}

# Rename files for clarity
# Convention: [sample_name]_[read_direction].fastq
mv original_R1_001.fastq sample1_R1.fastq
mv original_R2_001.fastq sample1_R2.fastq
```

### 4. Merging Multiple FASTQ Files

```bash
# Merge forward reads
cat sample1_L001_R1.fastq \
    sample1_L002_R1.fastq \
    sample1_L003_R1.fastq \
    sample1_L004_R1.fastq > merged_R1.fastq

# Merge reverse reads
cat sample1_L001_R2.fastq \
    sample1_L002_R2.fastq \
    sample1_L003_R2.fastq \
    sample1_L004_R2.fastq > merged_R2.fastq

# Verify file sizes
ls -lh merged_*.fastq
```

### 5. Initial Quality Control with FastQC

```bash
# Basic usage
fastqc merged_R1.fastq merged_R2.fastq

# Advanced usage
fastqc \
    --outdir fastqc_reports \
    --threads 4 \
    --noextract \
    --format fastq \
    merged_R*.fastq

# Run on multiple files in parallel
parallel "fastqc {}" ::: *.fastq
```

#### Interpreting FastQC Reports

Key metrics to examine:
* Per base sequence quality
* Per sequence quality scores
* Per base sequence content
* Overrepresented sequences
* Adapter content
* GC content

### 6. Sequence Trimming with Trimmomatic

```bash
# Basic paired-end trimming
trimmomatic PE \
    -phred33 \
    merged_R1.fastq merged_R2.fastq \
    trimmed_R1P.fastq trimmed_R1U.fastq \
    trimmed_R2P.fastq trimmed_R2U.fastq \
    SLIDINGWINDOW:4:20 \
    LEADING:20 \
    TRAILING:20 \
    MINLEN:36

# Advanced trimming with adapter removal
trimmomatic PE \
    -phred33 \
    -threads 4 \
    merged_R1.fastq merged_R2.fastq \
    trimmed_R1P.fastq trimmed_R1U.fastq \
    trimmed_R2P.fastq trimmed_R2U.fastq \
    ILLUMINACLIP:/path/to/adapters/TruSeq3-PE.fa:2:30:10 \
    SLIDINGWINDOW:4:20 \
    LEADING:20 \
    TRAILING:20 \
    CROP:147 \
    HEADCROP:15 \
    MINLEN:36
```

#### Trimmomatic Parameters Explained

* **SLIDINGWINDOW:4:20**
  * Window size: 4 bases
  * Quality threshold: 20
  * Recommended ranges: Window 4-5, Threshold 15-30

* **LEADING/TRAILING:20**
  * Trim low quality bases from start/end
  * Adjust based on FastQC quality plot
  * Common range: 20-30

* **CROP:147**
  * Cut reads to specified length
  * Use when quality drops at specific position
  * Determine from FastQC per base quality

* **HEADCROP:15**
  * Remove specified number of bases from start
  * Use when consistent poor quality at read start
  * Check FastQC per base sequence content

* **MINLEN:36**
  * Discard reads below this length
  * Adjust based on downstream analysis needs
  * Typical ranges:
    * Assembly: 50-100
    * RNA-Seq: 36-50
    * ChIP-Seq: 30-50

### 7. Post-trimming Quality Control

```bash
# Run FastQC on trimmed files
fastqc trimmed_R*P.fastq

# Generate MultiQC report for easy comparison
multiqc .
```

## Best Practices

### File Management
* Maintain original files in a separate directory
* Use consistent naming conventions
* Track file provenance
* Calculate and verify checksums

### Quality Control
* Always run FastQC before and after trimming
* Compare paired-end read qualities
* Monitor sequence duplication levels
* Check for adapter contamination

### Resource Management
* Monitor disk space during merging
* Use appropriate thread counts
* Consider using ramdisk for temporary files
* Compress intermediate files when possible

### Common Issues and Solutions

#### Low Quality Scores
* Increase SLIDINGWINDOW threshold
* Adjust LEADING/TRAILING values
* Consider shorter CROP length

#### Adapter Contamination
* Use appropriate adapter sequences
* Adjust ILLUMINACLIP parameters
* Verify adapter orientation

#### Uneven Coverage
* Check for PCR duplicates
* Verify library complexity
* Consider sequence normalization

## Additional Resources

* [FastQC Documentation](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* [Trimmomatic Manual](http://www.usadellab.org/cms/?page=trimmomatic)
* [Illumina Adapter Sequences](https://support.illumina.com/downloads/illumina-adapter-sequences-document-1000000002694.html)

---

**Note**: Parameters should be adjusted based on your specific dataset and research goals. Always verify output quality after each step.