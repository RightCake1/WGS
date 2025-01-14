# Bacterial Species Identification and Characterization Guide

## Introduction
This guide covers various tools and platforms for bacterial species identification, strain typing, and virulence/resistance characterization using genomic data. Each tool offers unique features and specializes in different aspects of bacterial identification and characterization.

## Tools Overview

### 1. PubMLST
**Purpose**: Multi-Locus Sequence Typing (MLST) and species identification  
**Website**: [https://pubmlst.org/](https://pubmlst.org/)

#### Features
* Species identification
* MLST profiling
* Sequence analysis
* Population studies
* Evolutionary analysis

#### Usage Instructions
1. Navigate to Species ID section
2. Upload FASTA file
3. Select appropriate scheme if known
4. Submit for analysis

#### Output Interpretation
* Sequence Type (ST)
* Allelic profiles
* Species identification confidence
* Related sequence types
* Population structure data

### 2. KmerFinder
**Website**: [https://cge.cbs.dtu.dk/services/KmerFinder/](https://cge.cbs.dtu.dk/services/KmerFinder/)

#### Features
* Species identification
* Subspecies discrimination
* Contamination detection
* Template-free approach

#### Usage Instructions
1. Select input type (assembled genome/reads)
2. Upload FASTA file
3. Choose database version
4. Set parameters:
   * Threshold: 0.0-1.0
   * Database: Bacteria/Fungi
   * Quick mode: Yes/No

#### Output Interpretation
* Species prediction
* Confidence score
* Template coverage
* Depth of identification

### 3. PathogenWatch
**Website**: [https://pathogen.watch/](https://pathogen.watch/)

#### Features
* Species identification
* Antimicrobial resistance prediction
* Virulence factor detection
* Outbreak detection
* Global surveillance data

#### Usage Steps
1. Create account
2. Upload genome assembly
3. Select analysis type:
   * Basic identification
   * Complete characterization
   * Surveillance typing
4. Review results

#### Analysis Types
* **Basic Analysis**
  * Species identification
  * MLST typing
  * Basic resistance genes

* **Complete Analysis**
  * All basic features
  * Virulence factors
  * Plasmid replicons
  * Phylogenetic placement

* **Surveillance**
  * All complete features
  * Outbreak detection
  * Global context
  * Temporal analysis

### 4. Kleborate [Only for klebsiella species]
**Purpose**: Specialized tool for Klebsiella species  
**Source**: [GitHub Repository](https://github.com/klebgenomics/Kleborate)

#### Installation
```bash
# Via conda
conda create -n kleborate
conda activate kleborate
conda install -c bioconda kleborate

# Via pip
pip install kleborate

# From source
git clone https://github.com/klebgenomics/Kleborate.git
cd Kleborate
python setup.py install
```

#### Basic Usage
```bash
# Single genome analysis
kleborate -a contigs.fasta -o output.csv

# Multiple genome analysis
kleborate -a *.fasta -o batch_output.txt

# Advanced options
kleborate \
    -a contigs.fasta \
    --resistance \
    --virulence \
    --kaptive_k \
    --kaptive_o \
    -o detailed_output.txt
```

#### Features Detected
* Species identification
* MLST typing
* Resistance genes
* Virulence factors
* Capsule typing (K locus)
* O antigen typing
* Hypervirulence determinants
* Mobile genetic elements

## Best Practices

### Quality Control
* Verify assembly quality before submission
* Check for contamination
* Ensure appropriate coverage
* Validate species predictions across tools

### Data Management
* Maintain consistent naming conventions
* Document analysis parameters
* Archive raw results
* Track version numbers

### Analysis Strategy
1. Start with rapid tools (KmerFinder)
2. Confirm with specific tools (PubMLST)
3. Perform detailed characterization
4. Validate critical findings

### Common Issues and Solutions

#### Discordant Results
* Check assembly quality
* Verify coverage depth
* Consider mixed samples
* Use multiple tools for confirmation

#### Low Confidence Calls
* Improve assembly quality
* Increase sequencing depth
* Check for contamination
* Consider closely related species

## Additional Resources

* [CGE Tools](https://cge.cbs.dtu.dk/services/)
* [NCBI Pathogen Detection](https://www.ncbi.nlm.nih.gov/pathogens/)
* [BacWGSTdb](http://bacdb.org/BacWGSTdb/)
* [Kleborate](https://kleborate.readthedocs.io/en/latest/Installation.html)
* [Bacterial Typing Tools Directory](https://www.applied-maths.com/applications/bacterial-typing)

---

**Note**: Regular updates of databases and tools are essential for accurate identification and characterization.