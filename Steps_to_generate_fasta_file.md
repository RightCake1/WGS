Steps to generate Fasta File
       
    1. get fastq sequence
    2. unzip
    3. rename them
    4. merge them in one fastq file using cat
code – cat file_names > new file name
    5. run fastqc on them 
Code -
fastqc name
    6. trimmomatic run  http://www.usadellab.org/cms/?page=trimmomatic 
       Code - 
       java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 R1.fastq R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36 
    7. run fastq again using fastqc *.fastq
    8. Run spades 
http://sepsis-omics.github.io/tutorials/modules/spades_cmdline/ 
https://github.com/ablab/spades 
only paired used since unpaired can’t be used in assembly
       Code -  spades.py 
       spades.py -1 R1p.fastq -2 R2p.fastq --careful --cov-cutoff auto -o spades_assembly_all_illumina
    9. Then Quast – assembly quality control http://quast.sourceforge.net/docs/manual.html 
       Code 
       python3 quast.py --min-contig 500 contigs.fasta
    10. Best matched file check and cut upto length 500 according to organism 
hypo protein, no significance, coding not
file name – contigs.fasta