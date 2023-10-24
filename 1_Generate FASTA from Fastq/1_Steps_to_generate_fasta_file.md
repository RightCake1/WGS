Steps to generate Fasta File
       
1.	Get fastq sequence

2.	Unzip

3.	You should get 4 files

4.	Rename them for ease of convinience 

5.	Merge them in one fastq file using cat for both reverse and forward read

6. 	You will now have 2 fastq files. One for forward and one for reverse read
 
Code –
 
`cat file_names > new R1.fastq`
`cat file_names > new R2.fastq`

5.	Run fastqc on the two files

[Source Page](https://github.com/s-andrews/FastQC)
 
Code -

`fastqc R1.fastq`
`fastqc R2.fastq`

Check the reports. If you see that there are red flags then you need to trim the sequence 

6.	Run and trim the sequence using Trimmomatic   

[Source Page](http://www.usadellab.org/cms/?page=trimmomatic)

Code - 

`java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 R1.fastq R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36`

u means unpaird ends and p means paired ends 
Headcrop, Crop, Minlength should be kept as per required from the report from FastQC 

7.	Run FastQC again using 

`fastqc *.fastq`

8.	Run spades for assembly and creating fasta file

[Tutorial](http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/)

[Source Page](https://github.com/ablab/spades) 

Only paired used since unpaired can’t be used in assembly

Code - 

`spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto -o spades_assembly_all_illumina`


