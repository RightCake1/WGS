# SeqKit: Essential Command Guide

## Introduction
SeqKit is a cross-platform toolkit for FASTA/Q file manipulation. This guide covers the most frequently used commands for basic sequence analysis. For comprehensive documentation, visit the [official SeqKit page](https://bioinf.shenwei.me/seqkit/) or check out the detailed [tutorial](https://bioinf.shenwei.me/seqkit/tutorial/).

## Installation
```bash
# Via conda
conda install -c bioconda seqkit

# Via homebrew
brew install seqkit
```

## Basic Commands

### File Inspection

Display sequence content:
```bash
# View sequence file content
cat contigs.fa

# Quick peek at first few sequences
head contigs.fa
```

### Sequence Statistics

Basic sequence statistics:
```bash
# Stats for a single file
seqkit stat input.fa

# Stats for multiple files with additional info
seqkit stats *.f{a,q}.gz -a

# Output includes: file format, sequence count, sum length, min length, 
# avg length, max length, and GC content
```

### Sequence Manipulation

Sort sequences:
```bash
# Sort by sequence length (longest to shortest)
seqkit sort --by-length input.fa > sorted.fa

# Sort by sequence length (shortest to longest)
seqkit sort --by-length --reverse input.fa > sorted_reverse.fa
```

Split sequences:
```bash
# Split multi-FASTA into separate files
seqkit split -i input.fasta

# Split by size (e.g., 1000 sequences per file)
seqkit split -s 1000 input.fasta
```

### Sequence Extraction

Extract subsequences:
```bash
# First 12 bases
seqkit subseq -r 1:12 input.fasta > first12.fasta

# Last 12 bases
seqkit subseq -r -12:-1 input.fasta > last12.fasta

# Remove first and last 12 bases
seqkit subseq -r 13:-13 input.fasta > trimmed.fasta
```

### Format Conversion

Convert between formats:
```bash
# FASTA to tabular format
seqkit fx2tab input.fa > output.tab

# Tabular to FASTA format
seqkit tab2fx input.tab > output.fa
```

## Tips and Best Practices

1. Use `-j` flag to enable multiple threads for faster processing
2. Always check output with `head` or `less` after operations
3. Use `seqkit stats` before and after operations to verify sequence counts
4. Consider using compressed files (.gz) to save space

## Common Flags

- `-j`: Number of threads
- `-v`: Verbose output
- `-o`: Output file
- `-w`: Line width for FASTA format (default: 60)

---
**Note**: This is a basic guide covering essential commands. For advanced usage, including pattern matching, sequence searching, and format validation, please refer to the [official documentation](https://bioinf.shenwei.me/seqkit/).