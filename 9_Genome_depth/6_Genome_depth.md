## Samtools and Bowtie2

### Bowtie2

- [Bowtie2 Installer](https://www.metagenomics.wiki/tools/bowtie2/install)
- [Bowtie2 About](https://www.metagenomics.wiki/tools/bowtie2)

### Samtools

- [Samtools About and Usage](http://www.htslib.org/doc/samtools-coverage.html)
- [Equations for Samtools](https://sarahpenir.github.io/bioinformatics/awk/calculating-mapping-stats-from-a-bam-file-using-samtools-and-awk/)
- [Samtools Installer Tutorial](https://www.youtube.com/watch?v=Y7zMbpSRvCk)

**Steps for Finding Depth Count:**

1. Have the FASTA file and R1p and R2p .fastq files for each isolate.

2. **Index**
   ```bash
   bwa index Your_file.fasta
   ```

3. **Make SAM file**
   ```bash
   bwa mem -t 12 Your_file.fasta R1p.fastq R2p.fastq > Your_file.sam
   ```

4. **Convert SAM to BAM**
   ```bash
   samtools view -S -b Your_file.sam > Your_file.bam
   ```

5. **Sort Alignment**
   ```bash
   samtools sort Your_file.bam --reference Your_file.fasta > Your_file_sort.bam
   ```

6. **Check Mean Read Depth**
   ```bash
   samtools depth -a Your_file_sort.bam | awk '{c++;s+=$3}END{print s/c}'
   ```

7. **Breadth of Coverage**
   ```bash
   samtools depth -a Your_file.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}'
   ```

