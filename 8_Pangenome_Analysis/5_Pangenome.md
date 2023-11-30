## Pangenome

### Roary

- [Roary Source Page](https://github.com/sanger-pathogens/Roary#installation)
- [Roary Paper](https://academic.oup.com/bioinformatics/article/31/22/3691/240757?login=true)
- [Roary Tutorial](https://www.youtube.com/watch?v=7UWmi5l_LFM)

**Requirements:**
- Conda/Miniconda
  - [Miniconda Source Page](https://github.com/conda/conda-docs/blob/main/docs/source/miniconda.rst)
  - [Miniconda Installer](https://gist.github.com/arose13/fcc1d2d5ad67503ba9842ea64f6bac35)

**Steps:**

1. Bring .gff files to Ubuntu home directory (not HDD).

2. Create an environment.
   ```bash
   conda activate pangenome
   ```

3. Download the Python script from GitHub (python.py file). Refer to the YouTube link for this.

4. Gather related strains.gff files from the Prokka folder.

5. Run Roary.
   ```bash
   roary -f roaryresults -p 6 -e -n -v --maft *.gff
   ```

6. Get FastTree.
   ```bash
   FastTree -nt -gtr roaryresult/core_gene_alignment.aln > roaryresult/mytree.newick
   ```

7. Get images.
   ```bash
   python roary_plots.py --labels roaryresult/mytree.newick roaryresult/gene_presence_absence.csv
   ```

8. Move the images to the roaryresult folder.

9. Make an SVG file.
   ```bash
   python roary_plots.py --labels --format svg roaryresult/mytree.newick roaryresult/gene_presence_absence.csv
   ```

