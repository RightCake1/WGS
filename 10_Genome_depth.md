# Read Mapping and Coverage Analysis Guide
## Using BWA, Samtools, and Bowtie2

## Introduction
This guide covers the process of mapping sequencing reads to a reference genome and analyzing coverage metrics using BWA, Samtools, and Bowtie2. These tools are essential for various genomic analyses, including variant calling and genome assembly validation.

## Installation

```bash
# Via conda (recommended)
conda create -n mapping
conda activate mapping
conda install -c bioconda bwa samtools bowtie2

# Verify installations
bwa
samtools --version
bowtie2 --version
```

## Read Mapping Workflow

### 1. Prepare Reference Genome

#### Using BWA
```bash
# Index reference genome
bwa index reference.fasta

# For large genomes, use bwtsw algorithm
bwa index -a bwtsw reference.fasta
```

#### Using Bowtie2
```bash
# Build Bowtie2 index
bowtie2-build reference.fasta reference_index

# For large genomes, use --large-index
bowtie2-build --large-index reference.fasta reference_index
```

### 2. Perform Read Mapping

#### BWA-MEM Mapping
```bash
# Basic mapping
bwa mem reference.fasta reads_R1.fastq reads_R2.fastq > output.sam

# Advanced mapping with multiple threads
bwa mem -t 12 Your_file.fasta R1p.fastq R2p.fastq > Your_file.sam
```

#### Bowtie2 Mapping
```bash
# Basic paired-end mapping
bowtie2 \
    -x reference_index \
    -1 reads_R1.fastq \
    -2 reads_R2.fastq \
    -S output.sam

# Advanced mapping options
bowtie2 \
    -x reference_index \
    -1 reads_R1.fastq \
    -2 reads_R2.fastq \
    --sensitive-local \
    --threads 12 \
    --maxins 1000 \
    --rg-id sample \
    --rg "SM:sample" \
    -S output.sam
```

### 3. SAM/BAM Processing

```bash
# Convert SAM to BAM
samtools view -S -b input.sam > output.bam

# Sort BAM file
samtools sort Your_file.bam --reference Your_file.fasta > Your_file_sort.bam
```

### 4. Coverage Analysis

```bash
# Basic coverage statistics
samtools coverage sorted.bam

# Detailed per-base coverage
samtools depth -a sorted.bam > coverage.txt

# Mean read depth
samtools depth -a sorted.bam | \
    awk '{c++;s+=$3}END{print "Mean depth = " s/c}'

# Coverage breadth (percentage of reference covered)
samtools depth -a Your_file_sort.bam | awk '{c++;s+=$3}END{print s/c}'

or 

samtools depth -a Your_file.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}'

# Coverage at different thresholds
samtools depth -a sorted.bam | \
    awk '{c++; if($3>=10) d10++; if($3>=20) d20++; if($3>=30) d30++}END{
        print "≥10x coverage: " (d10/c)*100 "%"
        print "≥20x coverage: " (d20/c)*100 "%"
        print "≥30x coverage: " (d30/c)*100 "%"
    }'
```

## Advanced Analysis

### Quality Filtering

```bash
# Filter by mapping quality
samtools view -q 30 -b sorted.bam > highqual.bam

# Filter proper pairs only
samtools view -f 2 -b sorted.bam > proper_paired.bam

# Remove unmapped, secondary, and supplementary alignments
samtools view -F 2308 -b sorted.bam > primary.bam
```

### Regional Analysis

```bash
# Get coverage for specific region
samtools depth -r "chr1:1000-2000" sorted.bam

# Extract reads from region
samtools view sorted.bam "chr1:1000-2000" > region.sam

# Calculate mean depth in region
samtools depth -r "chr1:1000-2000" sorted.bam | \
    awk '{c++;s+=$3}END{print s/c}'
```

## Best Practices

### Resource Management
* Allocate appropriate thread count
* Monitor memory usage
* Use sorted BAM files when possible
* Index reference genomes once and reuse

### Quality Control
* Check mapping statistics
* Verify proper pair rates
* Monitor duplicate levels
* Assess coverage uniformity

### Common Issues and Solutions

#### Low Mapping Rate
* Check read quality
* Verify reference genome
* Adjust mapping parameters
* Consider trimming reads

#### High Duplicate Rate
* Check library complexity
* Verify PCR conditions
* Consider removing duplicates
* Assess sequencing depth

#### Uneven Coverage
* Check GC bias
* Verify library preparation
* Consider PCR-free protocols
* Assess mapping quality

## Command Reference

### Important Samtools Flags
```plaintext
-F 4    # Remove unmapped reads
-f 2    # Keep only proper pairs
-q 30   # Minimum mapping quality 30
-b      # Output BAM format
-h      # Include header
```

### BWA-MEM Parameters
```plaintext
-t      # Thread count
-R      # Read group
-M      # Mark shorter split hits
-k      # Minimum seed length
```

### Bowtie2 Parameters
```plaintext
--sensitive-local    # Preset for local alignment
--maxins            # Maximum insert size
--no-mixed          # No unpaired alignments
--no-discordant     # No discordant alignments
```

## Additional Resources

* [BWA Manual](http://bio-bwa.sourceforge.net/bwa.shtml)
* [Samtools Documentation](http://www.htslib.org/doc/samtools.html)
* [Bowtie2 Manual](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)
* [SAM Format Specification](https://samtools.github.io/hts-specs/SAMv1.pdf)

---

**Note**: Parameters should be adjusted based on your specific dataset and research goals. Always verify output quality after each step.