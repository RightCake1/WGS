## Phylogeny Tree

### Tutorial Link
- [Phylogeny Tree Tutorial](https://www.youtube.com/watch?v=7GAYLbiyLuw)

**Steps:**

1. Construct the initial phylogenetic tree by generating the 16S RNA sequence using Barrnap.

2. Use Blastn to find and identify the most similar matches.
   - [Blastn Tutorial](https://blast.ncbi.nlm.nih.gov/Blast.cgi)

3. Install MEGA11 software.
   - [MEGA11 Download Page](https://www.megasoftware.net/)

4. Create a new text file and copy the sequences of your organism and similar matches following the rules:
   ```
   >Name_of_organism_Location_Year
   ACTGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
   ```

5. In MEGA, click *Align*, build a new alignment, and choose New Alignment.

6. Choose DNA and input your sequence file by pressing *Ctrl+D*.

7. Check for mistakes and then use the Muscle algorithm to align them. Choose the UPGMA option to construct a rooted phylogenetic tree. Save the file in Mega format.

8. Go back to the MEGA application, choose *Phylogeny*, and select the tree type you want. Keep default parameters and adjust the p-value if necessary.

9. Use [iTOL](https://itol.embl.de/) to edit the tree. Save the tree as desired.