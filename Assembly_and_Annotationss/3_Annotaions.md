## Annotations

### RAST

- [RAST Source Page](https://rast.nmpdr.org/rast.cgi?page=Upload)
- [RAST Tutorial](https://www.theseed.org/wiki/SEED_Viewer_Tutorial)

After running RAST, examine the SEED Viewer for further analysis.

### Alternative to RAST

#### Prokka

- [Prokka Source Page](https://github.com/tseemann/prokka)

**Steps:**

1. **Create Environment**
    ```bash
    conda create -c bioconda -n prokka prokka
    ```

2. **Activate Prokka Environment**
    ```bash
    conda activate prokka
    ```

3. **Run Prokka on Fasta File**
    ```bash
    prokka file_name.fasta
    ```