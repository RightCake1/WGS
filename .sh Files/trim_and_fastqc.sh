# Step 1: Run Trimmomatic for Sequence Trimming
java -jar /home/mustafa/Downloads/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 new_R1.fastq new_R2.fastq R1p.fastq R1u.fastq R2p.fastq R2u.fastq SLIDINGWINDOW:4:20 LEADING:20 TRAILING:20 CROP:147 HEADCROP:15 MINLEN:36

# Step 2: Run FastQC Again
fastqc R1p.fastq R2p.fastq 
