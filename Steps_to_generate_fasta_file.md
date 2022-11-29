Steps to generate Fasta File
       
1.	Get fastq sequence

2.	Unzip

3.	Rename them

4.	Merge them in one fastq file using cat
 
Code –
 
cat file_names > new file name

5.	Run fastqc on them
 
Code -

`fastqc name`

6.	Trimmomatic run  

[Source Page](http://www.usadellab.org/cms/?page=trimmomatic)

Code - 

`java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 R1.fastq R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36`

7.	Run fastq again using 

`fastqc *.fastq`

8.	Run spades 

[Tutorial](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)

[Source Page](https://github.com/ablab/spades) 

Only paired used since unpaired can’t be used in assembly

Code - 

`spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff 
auto -o spades_assembly_all_illumina`

9.	Then run Quast – assembly quality control

[Source Page](http://quast.sourceforge.net/docs/manual.html) 

Code - 

`python3 quast.py --min-contig 500 contigs.fasta`

10.	Best matched file check and cut upto length 500 according 
to organism, hypo protein (In case quast doesnt cut 500)

11.	Choose file name – contigs.fasta
