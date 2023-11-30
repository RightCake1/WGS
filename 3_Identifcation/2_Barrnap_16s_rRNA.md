## Finding 16S-rRNA Sequence

### Barrnap

- [Barrnap Source Page](https://github.com/tseemann/barrnap)

**Code:**
```bash
barrnap -o rrna.fa Your_file.fasta rrna.gff
```
  - This rRNA sequence can be used for Phylogenetic tree building
### Alternative to Barrnap - Online Based

#### Contest16s

- [Contest16s Source Page](https://www.ezbiocloud.net/tools/contest16s)

1. Upload the FASTA file.
2. Open the generated .txt file to extract the 16S sequence.
3. Use BLAST to find a match.

### Table

| Tool                | Source Page                               | Code/Instructions                                       |
|---------------------|-------------------------------------------|----------------------------------------------------------|
| Barrnap             | [Barrnap Source Page](https://github.com/tseemann/barrnap) | `barrnap -o rrna.fa Your_file.fasta rrna.gff`            |
| Contest16s (Online) | [Contest16s Source Page](https://www.ezbiocloud.net/tools/contest16s) | Upload FASTA, extract sequence from .txt, use BLAST to find match |

Feel free to copy and paste this content into your Markdown file.