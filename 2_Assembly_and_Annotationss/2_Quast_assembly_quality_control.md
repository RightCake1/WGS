## Running QUAST for Assembly Quality Control

- [QUAST Source Page](http://quast.sourceforge.net/docs/manual.html)

### Code
```bash
python3 quast.py --min-contig ### contigs.fasta
```
- Insert number

or 

### Code
```bash
quast.py -o <output_directory> <assembly_file(s)>
```

-This command is used to run QUAST for assembly quality control, specifically filtering out contigs below ### number of base pairs. 
If needed, manual filtering can also be performed.
Run this tool where the .py file is present
