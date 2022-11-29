# **Steps to generate Fasta File**
       
1.	Get fastq sequence

2.	Unzip

3.	Rename them

4.	Merge them in one fastq file using cat
 
Code –
 
`cat file_names > new file_name`

5.	Run fastqc on them

[Source Page](https://github.com/s-andrews/FastQC)
 
Code -

`fastqc name`

6.	Run and trim the sequence using Trimmomatic   

[Source Page](http://www.usadellab.org/cms/?page=trimmomatic)

Code - 

`java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 R1.fastq R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36`

7.	Run fastq again using 

`fastqc *.fastq`

8.	Run spades for assembly and creating fasta file

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


# **Annotations**


*RAST*


[Source Page](https://rast.nmpdr.org/rast.cgi?page=Upload)


[Tutorial](https://www.theseed.org/wiki/SEED_Viewer_Tutorial)


After running RAST, check seed viewer and go for analysis


ALTERNATIVE TO RAST 


*Prokka*

[Source Page](https://github.com/tseemann/prokka)

Steps

1. Create environment 

Code -

`conda create -c bioconda -n prokka prokka`

2. Activate prokka enviroment 

Code – 

`conda activate prokka`

3. Then Code -

`prokka file_name.fasta`


# **Identification**

1. First use *pubmlst* 

[Source Page](https://pubmlst.org/)

Go to Species ID and upload the fasta file

2. Use *k-mer finder*

[Source Page](https://cge.cbs.dtu.dk/services/KmerFinder/)

3. Uss *fastANI* –  

Firstly download refseq first, rename it then run code

Code - 

`./fastANI -q Your_File.fasta -r RefSeq.fasta -o FastANI.txt`

**NOTE** Needs to be 95% or higher for match

4. Find 16s-rna sequence using *Barnap* 

[Source Page](https://github.com/tseemann/barrnap)

Need to use .gff file from rast or prokka

Code  - 

`barrnap -o rrna.fa Your_file.fasta rrna.gff`

*Alternative to barnap - Online based barnap*

*Contest16s*

[Source Page](https://www.ezbiocloud.net/tools/contest16s)

Just Upload the fasta file 

then open .txt file and take 16s sequence and blast to find match

Make table for these


# **AMR**

1. *Resfinder*

[Source Page](https://cge.cbs.dtu.dk/services/ResFinder/)

Just upload fasta file

2. *RGI - Resistance gene identifier*

[Source Page](https://card.mcmaster.ca/analyze/rgi) 

Just add fasta file

Make table for resistance to merge data

3. *Abricate* 

[Source Page](https://github.com/tseemann/abricate)

[Tutorial](https://www.youtube.com/watch?v=2SKrbweUFr8)  - 15.19 min

Code-

`abricate *.fasta` - for multiple files

`abricate Your_file.fasta`  - for single file


*Virulence* 

1. BIGSdb-Pasteur

[Multiple organism but no baumanii](https://bigsdb.pasteur.fr/)

2. BacWGSTdb 

[Multiple files](http://bacdb.cn/BacWGSTdb/analysis_single.php)

[Single file](http://bacdb.cn/BacWGSTdb/analysis_multiple.php)  

3. Virulence finder 

[Main Page](http://www.mgc.ac.cn/VFs/) 

[Accesible to all](http://www.mgc.ac.cn/VFs/main.htm)


*Insertion sequence finder*

1. *MGE*

[Source Page](https://www.genomicepidemiology.org/)   

2. *Dont use IS-finder* 

[Source Page](https://isfinder.biotoul.fr/blast/resultat.php?id=phpJAVCul&title=&prog=blastn) 


# **Pangenome**

*Roary*

[Source Page](https://github.com/sanger-pathogens/Roary#installation)

[Paper](https://academic.oup.com/bioinformatics/article/31/22/3691/240757?login=true)

[Tutorial](https://www.youtube.com/watch?v=7UWmi5l_LFM)

*Requires conda/miniconda* 

[Miniconda](https://github.com/conda/conda-docs/blob/main/docs/source/miniconda.rst)

[Miniconda Installer](https://gist.github.com/arose13/fcc1d2d5ad67503ba9842ea64f6bac35)

Steps 

1. Bring .gff files ubuntu home and not hdd 

2. Create environment 

Code - 

`conda activate pangenome`

3. Download python script from github - python.py file 
(Check the youtube link for this) 

4. Gather related strains.gff files from prokka folder

5. Code for roary - 

Code - 

`roary -f roaryresults -p 6 -e -n -v --maft *.gff`

6. Get Fast-tree 

Code - 

`FastTree -nt -gtr roaryresult/core_gene_alignment.aln > roaryresult/mytree.newic`

7. Get images 

Code - 

`python roary_plots.py --labels roaryresult/mytree.newick roaryresult/gene_presence_absence.csv` 

8. Move the images to folder roaryresult

9. Make SVG file 

Code - 

`python roary_plots.py --labels --format svg roaryresult/mytree.newick roaryresult/gene_presence_absence.csv`
 

# **Samtools and bowtie2**

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


# **Plasmid Seeker**

A. *Deeplasmid* 

[Source Page](https://github.com/wandreopoulos/deeplasmid)

*Requires Docker account*

*Docker login issues* - 

[Fix for login](https://phoenixnap.com/kb/docker-permission-denied#ftoc-heading-4)
 
Docker issue may come again and again so use the fix whenever needed 

(Used method 3)

Code - 

`sudo groupadd -f docker`

`sudo usermod -aG docker $USER`

`newgrp docker`

`groups`

*Steps*

1. Need to bring fasta file to home 

Code - 

`docker run -it -v /home/mustafa/M01094-002.fasta:/srv/jgi-ml/classifier/dl/in.fasta -v`

`/home/mustafa/DeeplasmidResults:/srv/jgi-ml/classifier/dl/outdir billandreo/deeplasmid feature_DL_plasmid_predict.sh in.fasta outdir` 

Results example - 47 NODE_16_length_67951_cov_53.067574 decision=MAIN, avr score: 0.000 +/- 0.000  len=68.0k samples=180
Counts: Plasm=4  Ambig=0  Main=43  nCount=47

B. *Platon*
 
[Source Page](https://github.com/oschwengers/platon)

Steps 

1. Need to bring fasta files to home

2. Create environment for platon

Code - 

`conda activate platon`

3. Code for platon 

`platon --db db --output PlatonResults M00371-002.fasta`



