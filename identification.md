**Identification**

1. First use pubmlst 

[Source Page](https://pubmlst.org/)

Go to Species ID and upload the fasta file

2. Use kmer finder 

[Source Page](https://cge.cbs.dtu.dk/services/KmerFinder/)

3. Uss fastAfNI –  

Firstly download refseq first, rename it then run code

Code - 

`./fastANI -q Your_File.fasta -r RefSeq.fasta -o FastANI.txt`

**NOTE** Needs to be 95% or higher for match

4. Find 16s rna sequence using using barnap 

[Source Page](https://github.com/tseemann/barrnap)

Need to use .gff file from rast or prokka

Code  - 

`barrnap -o rrna.fa Your_file.fasta rrna.gff`

*Alternative to barnap - Online based barnap*

[Source Page](https://www.ezbiocloud.net/tools/contest16s)

Just Upload the fasta file 

then open .txt file and take 16s sequence and blast to find match

Make table for these