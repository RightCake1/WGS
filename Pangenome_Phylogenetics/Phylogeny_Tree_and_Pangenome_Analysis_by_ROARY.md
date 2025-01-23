# Pangenome Analysis Guide Using Roary

## Introduction
Roary is a high-speed bacterial pangenome pipeline that can compute the pangenome of large datasets of bacterial isolates (1000s) within minutes. This guide covers installation, usage, and visualization of pangenome analyses.

## Installation and Setup

### Prerequisites
```bash
# Install Miniconda (if not already installed)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Initialize conda
source ~/.bashrc
```

### Create Conda Environment
```bash
# Create and activate environment
conda create -n pangenome
conda activate pangenome

# Install required packages
conda install -c bioconda roary
conda install -c bioconda fasttree
conda install -c conda-forge biopython
conda install -c conda-forge numpy
conda install -c conda-forge matplotlib
```

### Download Visualization Scripts
```bash
# Download roary plots script
wget https://raw.githubusercontent.com/sanger-pathogens/Roary/master/contrib/roary_plots.py

# Make executable
chmod +x roary_plots.py
```

## Running Roary
```bash
# Create an environment. 
Code:
conda activate pangenome
# Annotate related strains and generated .gff files using Prokka. 
Code:
for file in *.fasta; do
prokka --outdir output_"${file%.fasta}" "$file"
done 
# Run Roary. 
Code:
Roary -f Roaryresults -p 6 -e -n -v --maft *.gff
# Use FastTree. 
Code:
FastTree -nt -gtr -gamma -boot 100 -spr 4 Roaryresult/core_gene_alignment.aln > Roaryresult/mytree.newick
# Generate images. 
Code:
python Roary_plots.py --labels Roaryresult/mytree.newick Roaryresult/gene_presence_absence.csv
# Created an SVG file. 
Code:
python Roary_plots.py --labels --format svg Roaryresult/mytree.newick Roaryresult/gene_presence_absence.csv
```

### Parameter Explanations
* `-f`: Output directory
* `-e`: Create gene alignment files
* `-n`: Fast core gene alignment
* `-v`: Verbose output
* `-p`: Number of threads
* `-i`: Minimum percentage identity
* `-cd`: Percentage of isolates for core definition
* `-g`: Maximum clusters
* `-s`: Don't split paralogs
* `--mafft`: Use MAFFT for alignment

## Phylogenetic Tree Construction

### Using FastTree
```bash
# Generate tree from core gene alignment
FastTree \
    -nt \               # Nucleotide alignment
    -gtr \              # Generalized time-reversible model
    roary_output/core_gene_alignment.aln > roary_output/tree.newick

# With bootstrap values
FastTree \
    -nt \
    -gtr \
    -boot 1000 \
    roary_output/core_gene_alignment.aln > roary_output/bootstrap_tree.newick
```


### Advanced Visualization
```bash
# Customized plots
python roary_plots.py \
    --labels \
    --format svg \
    --font_size 12 \
    --width 15 \
    --height 10 \
    roary_output/tree.newick \
    roary_output/gene_presence_absence.csv
```

## Output Files and Analysis

### Key Output Files
```plaintext
gene_presence_absence.csv          # Main results table
gene_presence_absence.Rtab         # Binary matrix of gene presence/absence
core_gene_alignment.aln           # Core genes aligned
pan_genome_reference.fa           # All genes in FASTA format
clustered_proteins               # Clustered proteins
number_of_genes_in_pan_genome.Rtab  # Pan-genome size analysis
```

### Analyzing Results
1. Core genome size
2. Accessory genome distribution
3. Strain relationships
4. Gene presence/absence patterns
5. Functional annotations

## Best Practices

### Input Preparation
* Use consistent annotation methods
* Verify GFF3 format compliance
* Check for contamination
* Use appropriate strain selection

### Resource Management
* Adjust thread count appropriately
* Monitor memory usage
* Use SSD for temporary files
* Consider job scheduling for large datasets

### Quality Control
* Check alignment quality
* Verify core gene definitions
* Validate phylogenetic trees
* Assess clustering parameters

## Common Issues and Solutions

### Memory Issues
* Reduce thread count
* Increase memory allocation
* Split dataset into smaller batches
* Use memory-efficient mode

### Long Runtime
* Check input file quality
* Adjust parallelization
* Optimize temporary file location
* Consider hardware limitations

### Visualization Problems
* Check Python dependencies
* Verify file formats
* Adjust plot parameters
* Use appropriate file paths

## Additional Analysis Tools

### R Analysis Scripts
```R
# Read presence/absence matrix
pan_matrix <- read.table("gene_presence_absence.Rtab", 
                        header=TRUE, 
                        row.names=1, 
                        sep="\t")

# Calculate summary statistics
core_genes <- rowSums(pan_matrix == 1) == ncol(pan_matrix)
accessory_genes <- rowSums(pan_matrix == 1) < ncol(pan_matrix)
```

### Additional Visualization
```python
# Generate clustered heatmap
import seaborn as sns
import pandas as pd

matrix = pd.read_csv("gene_presence_absence.Rtab", sep="\t", index_col=0)
sns.clustermap(matrix, cmap="YlOrRd", figsize=(15, 10))
```

## Additional Resources

* [Roary GitHub](https://github.com/sanger-pathogens/Roary)
* [Roary Paper](https://academic.oup.com/bioinformatics/article/31/22/3691/240757)
* [Pangenome Analysis Methods](https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-020-00928-4)

## Tool Comparison

| Feature            | Roary | BPGA   | PanX   | PGAP   |
|-------------------|-------|--------|--------|--------|
| Speed             | Fast  | Medium | Medium | Slow   |
| Memory Usage      | High  | Low    | Medium | High   |
| Visualization     | Basic | Good   | Best   | Basic  |
| Scalability       | High  | Medium | Medium | Low    |
| Ease of Use       | Easy  | Medium | Medium | Hard   |

---

**Note**: Regular updates of tools and appropriate parameter selection are essential for accurate analysis.