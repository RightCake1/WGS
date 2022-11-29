**Pangenome**

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