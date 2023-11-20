Run spades for assembly and creating fasta file

[Tutorial](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)

[Source Page](https://github.com/ablab/spades) 

Only paired are used since unpaired can’t be used in assembly

Code - 

`spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto -o spades_assembly_all_illumina`

For reference based assembly, we need reference sequence first

Code - 

`spades -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto --careful --trusted-contigs Reference.fasta -o spades_assembly_all_illumina`

For web based assemblies [Bacterial and viral bioinformatics resource center](https://www.bv-brc.org/) is a good alternative. It have different methods for assembly.

*BONUS*

You can use SnakeMake (This for abit of advanced users)

[Source Page](https://github.com/Lagator-Group/De-Novo-Plasmid-Assembly-and-Annotation-Snakemake)