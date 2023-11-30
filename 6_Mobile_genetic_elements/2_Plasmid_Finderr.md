## Plasmid Seeker

### A. Deeplasmid

- [Deeplasmid Source Page](https://github.com/wandreopoulos/deeplasmid)
- *Requires Docker account*
- **Docker Login Issues:**
  - [Fix for Login](https://phoenixnap.com/kb/docker-permission-denied#ftoc-heading-4)
  - Docker login issues may arise, use the fix whenever needed (Method 3 recommended).

**Steps:**

1. **Bring Fasta File to Home**
   ```bash
   docker run -it -v /home/mustafa/Your_file.fasta:/srv/jgi-ml/classifier/dl/in.fasta -v /home/mustafa/DeeplasmidResults:/srv/jgi-ml/classifier/dl/outdir billandreo/deeplasmid feature_DL_plasmid_predict.sh in.fasta outdir
   ```
   - Example Result: 47 NODE_16_length_67951_cov_53.067574 decision=MAIN, avr score: 0.000 +/- 0.000  len=68.0k samples=180 Counts: Plasm=4  Ambig=0  Main=43  nCount=47

### B. Platon

- [Platon Source Page](https://github.com/oschwengers/platon)

**Steps:**

1. **Bring Fasta Files to Home**

2. **Create Environment for Platon**
   ```bash
   conda activate platon
   ```

3. **Run Platon**
   ```bash
   platon --db db --output PlatonResults Your_file.fasta
   ```

