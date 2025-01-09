# Plasmid Detection Tools Guide

A comprehensive guide for identifying plasmids using Deeplasmid, Platon, and MOB-suite.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Tools Overview](#tools-overview)
- [Deeplasmid Analysis](#deeplasmid-analysis)
- [Platon Analysis](#platon-analysis)
- [MOB-suite Analysis](#mob-suite-analysis)
- [Troubleshooting](#troubleshooting)

## Prerequisites
- Docker account
- Conda environment
- Input FASTA files
- Basic command line knowledge

## Tools Overview

### Supported Tools
1. **Platon**: Plasmid contig classification
2. **MOB-suite**: Plasmid mobility prediction

## Platon Analysis

### Setup
1. Create Conda environment
```bash
conda create -n platon
conda activate platon
conda install platon
```

### Usage
```bash
# Activate environment
conda activate platon

# Run Platon
platon --db db --output PlatonResults Your_file.fasta
```

## MOB-suite

### Installation
1. **Using Conda (Recommended)**
```bash
# Create and activate new environment
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda install -c bioconda mob_suite

2. **Using pip**
```bash
pip install mob_suite
```

3. **Dependencies**
- BLAST+ (v2.7.1 or higher)
- MMSeqs2
- Mash
- bioperl
- ncbi-blast+

```bash
# Install dependencies via conda
conda install -c bioconda blast mmseqs2 mash perl-bioperl ncbi-blast+
```

### Usage
```bash
# Activate environment (if using conda)
conda activate mob_suite

# Run MOB-suite analysis
mob_recon -i contigs.fasta -o Plasmids_list
```

### Common Options
```bash
mob_recon --help  # Display all available options

# Basic usage with additional parameters
mob_recon \
    -i contigs.fasta \
    -o output_directory \
    --run_typer \  # Include plasmid typing
    --keep_tmp \   # Keep temporary files
    -n 8          # Use 8 threads
```

## Troubleshooting

### Docker Issues
1. Permission denied errors:
   - Follow the [Docker permission fix guide](https://phoenixnap.com/kb/docker-permission-denied#ftoc-heading-4)
   - Use Method 3 for most reliable results

### Common Problems
- Docker login failures
- Conda environment conflicts
- File permission issues

## Additional Resources
- [Platon GitHub](https://github.com/oschwengers/platon)
- [MOB-suite](https://github.com/phac-nml/mob-suite)

## License
[Add your chosen license]

## Contributing
[Add contribution guidelines if applicable]

## Citation
If you use these tools in your research, please cite:
```
[Add citations for Deeplasmid, Platon, and MOB-suite]
```
