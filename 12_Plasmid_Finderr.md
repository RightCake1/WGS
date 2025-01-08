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
1. **Deeplasmid**: Deep learning-based plasmid identification
2. **Platon**: Plasmid contig classification
3. **MOB-suite**: Plasmid mobility prediction

## Deeplasmid Analysis

### Setup
1. Install Docker
2. [Fix Docker permissions](https://phoenixnap.com/kb/docker-permission-denied#ftoc-heading-4) if needed
   - Method 3 recommended for permission issues

### Usage
```bash
# Run Deeplasmid analysis
docker run -it \
    -v /home/username/Your_file.fasta:/srv/jgi-ml/classifier/dl/in.fasta \
    -v /home/username/DeeplasmidResults:/srv/jgi-ml/classifier/dl/outdir \
    billandreo/deeplasmid feature_DL_plasmid_predict.sh in.fasta outdir
```

### Output Interpretation
Example output:
```
47 NODE_16_length_67951_cov_53.067574
decision=MAIN, avr score: 0.000 +/- 0.000
len=68.0k samples=180
Counts: Plasm=4  Ambig=0  Main=43  nCount=47
```

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

## MOB-suite Analysis

I'll update the documentation to include MOB-suite installation steps.

# Plasmid Detection Tools Guide

[Previous sections remain the same until MOB-suite Analysis]

## MOB-suite Analysis

### Installation
1. **Using Conda (Recommended)**
```bash
# Create and activate new environment
conda create -n mob_suite python=3.8
conda activate mob_suite

# Install mob_suite
conda install -c bioconda mob_suite
```

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
- [Deeplasmid GitHub](https://github.com/wandreopoulos/deeplasmid)
- [Platon GitHub](https://github.com/oschwengers/platon)

## License
[Add your chosen license]

## Contributing
[Add contribution guidelines if applicable]

## Citation
If you use these tools in your research, please cite:
```
[Add citations for Deeplasmid, Platon, and MOB-suite]
```
