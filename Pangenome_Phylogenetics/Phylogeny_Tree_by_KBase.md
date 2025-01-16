# Creating a Phylogeny Tree using KBase

## Preparing Files

1. Retrieve FASTA files from [IMG/M](https://img.jgi.doe.gov/). First, create an account. Go to the [Genome Search](https://img.jgi.doe.gov/cgi-bin/mer/main.cgi?section=GenomeSearch&page=searchForm) page, select **Advanced Search Builder**, and click **Add new builder line**. Choose **taxonomy**, then **NCBI SPECIES**, and type the organism name to get all genomes. To get completed or high-quality sequences, add another builder line, select **sequencing assembly annotation**, then **sequencing quality**, and pick **level 6** for the best quality. Click **EVALUATE QUERY** to check the number of available sequences, then click **SEARCH**.

2. Wait for the results. You can customize the table by scrolling down and selecting options. Under **NCBI Metadata**, choose **NCBI Assembly Accession** and **NCBI GenBank ID**, then click **REDISPLAY**. The table will show GCA IDs linking to the sequence profile. Select all by clicking the checkbox at the top left of the table, then click **EXPORT** to get the table.

3. To download sequences in bulk, select all and click **ADD TO GENOME CART**, then wait for the page to reload. Click **Upload & Export & Save**, then **Export Genomes**, ensuring all genomes are selected. You will be notified by email when the download is ready.

## Using KBase

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