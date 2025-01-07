# SPAdes Genome Assembly Guide

## Introduction
SPAdes (St. Petersburg genome assembler) is a versatile toolkit for genome assembly, particularly effective for bacterial genomes. This guide covers basic usage and common scenarios.

## Installation

```bash
# Via conda
conda create -n spades spades
conda activate spades

# Verify installation
spades.py --version
```

## Basic Assembly Commands

### De Novo Assembly with Paired Reads
```bash
# Basic paired-end assembly
spades.py \
    -1 forward_reads.fastq \
    -2 reverse_reads.fastq \
    -o spades_output

# Careful mode (recommended for bacterial genomes)
spades.py \
    -1 forward_reads.fastq \
    -2 reverse_reads.fastq \
    --careful \
    --cov-cutoff auto \
    -o spades_assembly_careful
```

### Reference-Guided Assembly
```bash
# Assembly with trusted reference contigs
spades.py \
    -1 forward_reads.fastq \
    -2 reverse_reads.fastq \
    --careful \
    --cov-cutoff auto \
    --trusted-contigs reference.fasta \
    -o reference_guided_assembly
```

## Common Parameters

```bash
# Memory and thread control
--memory 64        # Set memory limit in GB
--threads 16       # Number of threads to use

# Quality control
--careful          # Reduces mismatches and short indels
--cov-cutoff auto  # Automatic coverage cutoff threshold
--isolate         # Optimized for single isolate genomes


## Output Files

Key output files in the assembly directory:
```plaintext
contigs.fasta     # Final contigs
scaffolds.fasta   # Final scaffolds
assembly_graph.fastg  # Assembly graph
contigs.paths     # Paths in the assembly graph
scaffolds.paths   # Scaffold paths
spades.log        # Log file
params.txt        # Parameters used
```

## Alternative Assembly Options

### Web-Based Assembly
The Bacterial and Viral Bioinformatics Resource Center (BV-BRC) offers web-based assembly:
- URL: https://www.bv-brc.org/
- Supports multiple assembly algorithms
- Provides quality assessment tools
- Enables comparative analysis

### Automation with Snakemake
For high-throughput or repetitive assemblies:
- [Assembly Pipeline Repository](https://github.com/Lagator-Group/De-Novo-Plasmid-Assembly-and-Annotation-Snakemake)
- Automates assembly workflow
- Ensures reproducibility
- Handles multiple samples efficiently

## Best Practices

1. Quality Control
   - Always check input read quality
   - Use --careful for better accuracy
   - Monitor coverage distribution

2. Resource Management
   - Allocate sufficient memory
   - Use appropriate thread count
   - Monitor disk space

3. Output Validation
   - Check assembly statistics
   - Verify contig lengths
   - Assess coverage uniformity

## Troubleshooting Tips

1. Common Issues
   - Insufficient memory: Increase --memory parameter
   - Long runtime: Check input quality
   - Failed error correction: Try --only-assembler

2. Quality Checks
   - Use QUAST for assembly evaluation
   - Check coverage with BBMap
   - Validate completeness with BUSCO

## Additional Resources

- [SPAdes GitHub Repository](https://github.com/ablab/spades)
- [SPAdes Manual](http://cab.spbu.ru/files/release3.15.5/manual.html)
- [Tutorial](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)

---
**Note**: This guide covers basic usage. For advanced features and detailed parameters, consult the [official documentation](https://github.com/ablab/spades).