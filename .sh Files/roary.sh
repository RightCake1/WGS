#!/bin/bash

# Roary Source Page
# [Roary Source Page](https://github.com/sanger-pathogens/Roary#installation)

# Step 1: Activate the Conda environment
conda activate pangenome

# Step 2: Download the Python script from GitHub
# (Refer to the YouTube link for this step)

# Step 3: Move .gff files to the home directory (not HDD)

# Step 4: Run Roary
roary -f roaryresults -p 6 -e -n -v --maft *.gff

# Step 5: Get FastTree
FastTree -nt -gtr roaryresult/core_gene_alignment.aln > roaryresult/mytree.newick

# Step 6: Get images
python roary_plots.py --labels roaryresult/mytree.newick roaryresult/gene_presence_absence.csv

# Step 7: Move the images to the roaryresult folder
mv *.png roaryresult/

# Step 8: Make an SVG file
python roary_plots.py --labels --format svg roaryresult/mytree.newick roaryresult/gene_presence_absence.csv
