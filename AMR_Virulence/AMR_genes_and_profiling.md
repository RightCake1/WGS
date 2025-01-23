# Antimicrobial Resistance (AMR) Analysis Tools Guide

## Introduction
This guide covers essential tools for antimicrobial resistance analysis in bacterial genomes. Each tool offers unique features for detecting and analyzing resistance genes and mutations.

## Commonly Used Tools

### ResFinder
Web-based tool for identifying acquired antimicrobial resistance genes.

```bash
# Web-based tool - No command line required
URL: https://cge.cbs.dtu.dk/services/ResFinder/

# Key Features:
- Identifies acquired antimicrobial resistance genes
- Detects chromosomal mutations
- Supports both assembled genomes and raw reads
- Provides detailed resistance gene annotations
```

### RGI (Resistance Gene Identifier)
CARD's primary tool for predicting resistome from genome sequences.

```bash
# Web interface
URL: https://card.mcmaster.ca/analyze/rgi
```

## ABRicate
Mass screening of contigs for antimicrobial resistance genes.

```bash
# Installation
conda install -c bioconda abricate

# Basic usage
abricate your_file.fasta              # Single file analysis
abricate *.fasta                      # Multiple files analysis
abricate --summary *.fasta > summary.tab  # Create summary table

# Database options
abricate --list                       # List available databases
abricate --db card --file input.fasta # Use CARD database
abricate --db resfinder input.fasta   # Use ResFinder database

# Minimum coverage threshold
abricate --minid 80 --mincov 60 input.fasta
```

## Advanced Tools

### abriTAMR
Pipeline for generating AMR reports from sequence data.

```bash
# Installation via conda
conda create -n abritamr -c bioconda abritamr
conda activate abritamr

# Basic usage
abritamr run --contigs genome.fasta --prefix klebsiella_amr --species Klebsiella_pneumoniae
```

## AMR Classification Guidelines

### MDR, XDR, PDR Criteria
Reference: [Clinical Microbiology and Infection Journal](https://www.clinicalmicrobiologyandinfection.com/article/S1198-743X(14)61632-3/fulltext)

Key definitions:
- MDR (Multidrug-Resistant): Non-susceptible to ≥1 agent in ≥3 antimicrobial categories
- XDR (Extensively Drug-Resistant): Non-susceptible to ≥1 agent in all but ≤2 categories
- PDR (Pandrug-Resistant): Non-susceptible to all antimicrobial agents listed

## Best Practices

1. Always use the latest database versions for accurate results
2. Cross-validate results using multiple tools
3. Consider minimum coverage and identity thresholds
4. Keep detailed records of database versions and parameters used
5. Validate critical findings with phenotypic testing

## Additional Resources

- [CARD Database](https://card.mcmaster.ca/)
- [ResFinder Database](https://cge.cbs.dtu.dk/services/ResFinder/)
- [NCBI AMRFinder](https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/)

---
**Note**: This guide covers basic usage. For detailed parameters and advanced features, refer to each tool's documentation.
