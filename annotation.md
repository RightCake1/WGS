Annotations 

RAST 
[Source Page](https://rast.nmpdr.org/rast.cgi?page=Upload)
[Tutorial](https://www.theseed.org/wiki/SEED_Viewer_Tutorial)
After running RAST, check seed viewer and go for analysis


ALTERNATIVE TO RAST 

Prokka  

[Source Page](https://github.com/tseemann/prokka)
Steps

Create environment 

Code -

`conda create -c bioconda -n prokka prokka`

Activate prokka enviroment 

Code – 

`conda activate prokka`

Then 

Code -

`prokka file_name.fasta`

Check the txt file 

contigs should be under 200

Make a table to note size, gc, l50,n50,no of contig, largest notig etc.