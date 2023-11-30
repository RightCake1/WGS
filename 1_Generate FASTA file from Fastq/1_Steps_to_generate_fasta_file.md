Steps to Generate Fasta File

1. **Get Fastq Sequence**

2. **Unzip**
   - You should get 4 files

3. **Rename Files for Convenience**

4. **Merge Files into One Fastq File**
   ```bash
   cat file_names > new_R1.fastq
   cat file_names > new_R2.fastq
   ```

5. **Run FastQC on the 2 Merged Files**
   - [FastQC Source Page](https://github.com/s-andrews/FastQC)
   ```bash
   fastqc new_R1.fastq
   fastqc new_R2.fastq
   ```

   Check the reports. If red flags are observed, trimming may be necessary.

6. **Run Trimmomatic for Sequence Trimming**
   - [Trimmomatic Source Page](http://www.usadellab.org/cms/?page=trimmomatic)
   ```bash
   java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 R1.fastq R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36
   ```

   - 'u' denotes unpaired ends, and 'p' denotes paired ends. 
   - Adjust parameters (SLIDINGWINDOW, LEADING, TRAILING, CROP, HEADCROP, MINLEN) based on FastQC report recommendations.
   - Change the path to Trimmomatic

7. **Run FastQC Again**
   ```bash
   fastqc *.fastq
   ```
```
