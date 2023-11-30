Running SPAdes for Assembly and Creating Fasta File

### SPAdes Command Line Tutorial
- [Tutorial Link](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)
- [SPAdes Source Page](https://github.com/ablab/spades)

### Assembly using Paired Reads
```bash
spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto -o spades_assembly
```

### Reference-Based Assembly
For reference-based assembly, a reference sequence is required.
```bash
spades -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto --careful --trusted-contigs Reference.fasta -o spades_assembly
```

### Web-Based Assemblies
[Bacterial and Viral Bioinformatics Resource Center](https://www.bv-brc.org/) provides alternative methods for web-based assemblies with different techniques.

### Bonus: SnakeMake for Advanced Users
- [SnakeMake Source Page](https://github.com/Lagator-Group/De-Novo-Plasmid-Assembly-and-Annotation-Snakemake)

