# FastANI Analysis and Visualization Guide

## Table of Contents
- [Installation](#installation)
- [FastANI Setup](#fastani-setup)
- [Visualization Script](#visualization-script)
- [Usage Examples](#usage-examples)
- [Common Issues](#common-issues)

## Installation

### 1. FastANI Installation

```bash
# Via conda (recommended)
conda create -n ani_tools
conda activate ani_tools
conda install -c bioconda fastani

# Via source
git clone https://github.com/ParBLiSS/FastANI.git
cd FastANI
make
```

### 2. Python Dependencies

```bash
# Install required Python packages
pip install numpy pandas seaborn matplotlib scikit-learn plotly scipy
```

## FastANI Setup

### Preparing Your Data

```bash
# Create a directory for your analysis
mkdir fastani_analysis
cd fastani_analysis

# Create a list of your genome files
ls *.fasta > genome_list.txt

# Run FastANI (example with multiple queries vs multiple references)
fastANI --ql query_list.txt --rl reference_list.txt -o fastani_results.txt
```

## Visualization Script

Save the following code as `fastani_viz.py`:

```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import hierarchical
import plotly.graph_objects as go
import plotly.express as px
from scipy.cluster.hierarchy import dendrogram

def load_fastani_results(file_path):
    """
    Load FastANI results into a pandas DataFrame
    """
    cols = ['query', 'reference', 'ani_value', 'fragments_mapped', 'total_fragments']
    df = pd.read_csv(file_path, sep='\t', names=cols)
    return df

def create_ani_matrix(df):
    """
    Convert FastANI results to a symmetric matrix
    """
    # Create a symmetric matrix of ANI values
    genomes = list(set(df['query'].unique()) | set(df['reference'].unique()))
    matrix = pd.DataFrame(index=genomes, columns=genomes)
    
    # Fill matrix with ANI values
    for _, row in df.iterrows():
        matrix.loc[row['query'], row['reference']] = row['ani_value']
        matrix.loc[row['reference'], row['query']] = row['ani_value']
    
    # Fill diagonal with 100 (self-comparison)
    np.fill_diagonal(matrix.values, 100)
    
    return matrix

def plot_heatmap(matrix, output_file="ani_heatmap.png"):
    """
    Create a heatmap visualization of ANI values
    """
    plt.figure(figsize=(12, 10))
    sns.heatmap(matrix, 
                cmap='YlOrRd',
                vmin=75,  # Minimum ANI value to consider
                vmax=100, # Maximum ANI value
                annot=True,
                fmt='.1f',
                square=True)
    plt.title('Average Nucleotide Identity (ANI) Heatmap')
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

def plot_interactive_heatmap(matrix, output_file="ani_heatmap.html"):
    """
    Create an interactive heatmap using plotly
    """
    fig = go.Figure(data=go.Heatmap(
        z=matrix.values,
        x=matrix.columns,
        y=matrix.index,
        colorscale='YlOrRd',
        zmin=75,
        zmax=100,
        hoverongaps=False))
    
    fig.update_layout(
        title='Interactive ANI Heatmap',
        xaxis_title="Reference Genomes",
        yaxis_title="Query Genomes",
        width=1000,
        height=800
    )
    
    fig.write_html(output_file)

def plot_dendrogram(matrix, output_file="ani_dendrogram.png"):
    """
    Create a dendrogram based on ANI values
    """
    # Convert similarity to distance
    distance_matrix = 100 - matrix
    
    # Perform hierarchical clustering
    linkage = hierarchical.ward(distance_matrix)
    
    # Plot dendrogram
    plt.figure(figsize=(12, 8))
    plt.title('Hierarchical Clustering Dendrogram based on ANI values')
    plt.ylabel('Distance (100 - ANI)')
    
    dendrogram(linkage, labels=matrix.index, leaf_rotation=90)
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

def create_scatter_plot(df, output_file="ani_scatter.png"):
    """
    Create a scatter plot of ANI values vs fragments mapped
    """
    plt.figure(figsize=(10, 6))
    plt.scatter(df['ani_value'], 
                df['fragments_mapped'] / df['total_fragments'] * 100,
                alpha=0.6)
    plt.xlabel('ANI Value')
    plt.ylabel('Fragments Mapped (%)')
    plt.title('ANI Values vs. Fragment Coverage')
    plt.grid(True, alpha=0.3)
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()

def main():
    # Example usage
    # Replace 'fastani_results.txt' with your actual results file
    results_file = 'fastani_results.txt'
    
    # Load FastANI results
    df = load_fastani_results(results_file)
    
    # Create matrix
    matrix = create_ani_matrix(df)
    
    # Generate visualizations
    plot_heatmap(matrix)
    plot_interactive_heatmap(matrix)
    plot_dendrogram(matrix)
    create_scatter_plot(df)

if __name__ == "__main__":
    main()
```

## Usage Examples

### Basic Usage

1. Run FastANI analysis:
```bash
# Single comparison
fastANI -q query.fasta -r reference.fasta -o results.txt

# Multiple comparisons
fastANI --ql query_list.txt --rl reference_list.txt -o results.txt
```

2. Run visualization script:
```bash
python fastani_viz.py
```

### Customizing Visualizations

You can modify the visualization parameters in the script:

1. Change heatmap colors:
```python
# In plot_heatmap function
sns.heatmap(matrix, cmap='Blues')  # or 'Reds', 'YlGnBu', etc.
```

2. Adjust figure sizes:
```python
plt.figure(figsize=(15, 12))  # Make plots larger
```

3. Modify dendrogram parameters:
```python
dendrogram(linkage, labels=matrix.index, leaf_rotation=45)  # Change label rotation
```

## Output Files

The script generates four visualization files:
1. `ani_heatmap.png`: Static heatmap visualization
2. `ani_heatmap.html`: Interactive heatmap (can be opened in web browser)
3. `ani_dendrogram.png`: Hierarchical clustering dendrogram
4. `ani_scatter.png`: Scatter plot of ANI values vs fragment coverage

## Common Issues

### Memory Issues
If you're analyzing many genomes and encounter memory issues:
```python
# Modify the main function to process in batches
def main():
    df = load_fastani_results('results.txt')
    
    # Process only first N genomes
    df_subset = df.head(50)  # Adjust number as needed
    matrix = create_ani_matrix(df_subset)
    
    plot_heatmap(matrix)
```

### Large Datasets
For large datasets, you might want to adjust the figure size and font size:
```python
def plot_heatmap(matrix, output_file="ani_heatmap.png"):
    plt.figure(figsize=(20, 16))
    sns.heatmap(matrix, 
                cmap='YlOrRd',
                vmin=75,
                vmax=100,
                annot=True,
                fmt='.1f',
                square=True,
                annot_kws={'size': 8})  # Adjust font size
    plt.xticks(rotation=90, fontsize=8)
    plt.yticks(fontsize=8)
    plt.title('Average Nucleotide Identity (ANI) Heatmap')
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    plt.close()
```

## Analysis Guidelines

### ANI Thresholds
- Species boundary: ≥95% ANI
- Genus boundary: ≥75% ANI
- Family boundary: ≥60% ANI

### Quality Control
- Ensure genome completeness >90%
- Check for contamination
- Verify minimum fragment coverage
- Use multiple reference strains when possible

## References
- FastANI GitHub: https://github.com/ParBLiSS/FastANI
- Documentation: https://github.com/ParBLiSS/FastANI/wiki