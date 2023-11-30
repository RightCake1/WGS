*Seqkit*

[Source page](https://bioinf.shenwei.me/seqkit/)
[Tutorial](https://bioinf.shenwei.me/seqkit/tutorial/)


```markdown
## Basic Commands

### Display Sequence
```bash
cat contigs.fa
```

### Basic Stats
```bash
seqkit stat hsa.fa
```
or
```bash
seqkit stats *.f{a,q}.gz -a
```

### Sort by Length
```bash
seqkit sort --by-length hsa.fa
```

### Split Sequence by Contig#
```bash
seqkit split -i fasta.file
```

### Extract Subsequences
- First 12 bases
  ```bash
  seqkit subseq -r 1:12 .fasta
  ```

- Last 12 bases
  ```bash
  seqkit subseq -r -12:-1 .fasta
  ```

- Subsequences without first and last 12 bases
  ```bash
  seqkit subseq -r 13:-13 .fasta.fasta
  ```

### Convert FASTA to Tabular Format
```bash
seqkit fx2tab seqs.msa.fa
```

