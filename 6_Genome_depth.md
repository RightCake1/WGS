**Samtools and bowtie2**

*Bowtie2* 

[Installer](https://www.metagenomics.wiki/tools/bowtie2/install)

[About](https://www.metagenomics.wiki/tools/bowtie2) 

Samtools

[About and Usage](http://www.htslib.org/doc/samtools-coverage.html)
 
[Equations for samtools](https://sarahpenir.github.io/bioinformatics/awk/calculating-mapping-stats-from-a-bam-file-using-samtools-and-awk/) 

[Installer](https://www.youtube.com/watch?v=Y7zMbpSRvCk) 



*Steps for finding depth count*

1. Need fasta file and R1p and R2p .fastq files of each isolate

2. Index 

Code -

`bwa index M00371-002.fasta`  

3. Make sam file

Code -

`bwa mem -t 12 M00371-002.fasta R1p.fastq R2p.fastq > 371.sam
Convert - samtools view -S -b 371.sam > 371.bam`

4. Sort alignment 

Code - 

`samtools sort 371.bam --reference M00371-002.fasta > 371sort.bam`

5. Check mean read depth 

Code -

`samtools depth -a 371sort.bam | awk '{c++;s+=$3}END{print s/c}'`

6. Breadth of coverage 

Code - 

`samtools depth -a file.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}'`