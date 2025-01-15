# Creating a Phylogeny Tree using KBase

1. Head over to [KBase](https://www.kbase.us/)
2. Click **Get Started**
3. Create an account and login
4. Wait for the plugin to load and then click **New Narrative** on the top right
5. Click the **plus** sign under **DATA** and then click **Import**
6. Import your FASTA files and then use the proper label for **IMPORT AS** to **FASTA ASSEMBLY**
7. Click **IMPORT SELECTED** and wait for them to load
8. After they are loaded, the **Import from Staging Area** window will pop up. 
9. Click **RUN** and wait for them to load into the data. You should see your files under the **DATA** panel now.

## Annotating Genomes

- If you have one FASTA file, under **APPS**, search for **Annotate Genome/Assembly with RASTtk - v1.073** under **GENOME ANNOTATION**.
- If you have multiple FASTA files, search for **Annotate Multiple Microbial Assemblies with RASTtk - v1.073** under **GENOME ANNOTATION**.
- Click **Run** after selecting your files. New files will be added under **DATA**.

## Creating a GenomeSet

1. Under **Comparative Genomics**, select **Add Genomes to GenomeSet - v1.7.6** and create a GenomeSet using the annotated files (Note: only annotated files will be visible under the add option).
2. Click **Run** after selecting your files. This can be done to handle huge file lists.

## Inserting Genomes into SpeciesTree

1. Under **Comparative Genomics**, click **Insert Set of Genomes Into SpeciesTree - v2.2.0**.
2. Select the GenomeSet(s) you made and add those, then click **RUN**. This might take time depending on the RAM. 
3. You can use the parameter **Neighbor Public Genome Count** to add extra organisms. 
4. If the organism is known, then 2-3 is okay; otherwise, keeping it at 1 is fine to create less clutter.

## Trimming the SpeciesTree

1. Under **Comparative Genomics**, click **Trim SpeciesTree to GenomeSet - v1.4.0** to omit extra things that may or may not have been included in the tree.
2. The tree is ready to download in Newick, -labels.newick, PNG, or PDF formats, whichever you need.