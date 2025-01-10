#!/bin/bash

# Create and install tools into the conda environments without activating them

# Create environment for sequence processing
echo "Creating conda environment for sequence processing..."
conda create -n seq_processing -y
conda install -n seq_processing -c bioconda fastqc trimmomatic -y
echo "FastQC and Trimmomatic installed successfully"
fastqc --version
trimmomatic -version

# Install SPAdes
echo "Installing SPAdes..."
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz
tar -xzf SPAdes-4.0.0-Linux.tar.gz
cd SPAdes-4.0.0-Linux/bin/
spades.py --version
echo "SPAdes installed successfully"
cd ../..

# Install QUAST
echo "Creating conda environment for QUAST..."
conda create -n bioinfo_quast python=3.8 -y
conda install -n bioinfo_quast -c bioconda quast -y
echo "QUAST installed successfully"
quast.py --version

# Install SeqKit
echo "Installing SeqKit..."
conda install -n seq_processing -c bioconda seqkit -y
echo "SeqKit installed successfully"
# For homebrew users:
# brew install seqkit

# Install Prokka
echo "Creating conda environment for Prokka..."
conda create -c bioconda -n prokka prokka -y
conda install -n prokka prokka -y
echo "Prokka installed successfully"

# Install Kleborate
echo "Creating conda environment for Kleborate..."
conda create -n kleborate -y
conda install -n kleborate -c bioconda kleborate -y
echo "Kleborate installed successfully"

# Install Barrnap
echo "Creating conda environment for rRNA tools..."
conda create -n rRNA_tools -y
conda install -n rRNA_tools -c bioconda barrnap -y
echo "Barrnap installed successfully"
barrnap --version

# Install FastANI
echo "Creating conda environment for ANI tools..."
conda create -n ani_tools -y
conda install -n ani_tools -c bioconda fastani -y
echo "FastANI installed successfully"
# Alternatively, install from source:
# git clone https://github.com/ParBLiSS/FastANI.git
# cd FastANI
# make
# fastANI --version

# Install mapping tools (BWA, Samtools, Bowtie2)
echo "Creating conda environment for mapping tools..."
conda create -n mapping -y
conda install -n mapping -c bioconda bwa samtools bowtie2 -y
echo "Mapping tools installed successfully"
bwa
samtools --version
bowtie2 --version

# Install ABRicate
echo "Installing ABRicate..."
conda install -n seq_processing -c bioconda abricate -y
echo "ABRicate installed successfully"

# Install ABRitamr
echo "Creating conda environment for ABRitamr..."
conda create -n abritamr -c bioconda abritamr -y
conda install -n abritamr -y
echo "ABRitamr installed successfully"

# Install Platon
echo "Creating conda environment for Platon..."
conda create -n platon -y
conda install -n platon platon -y
echo "Platon installed successfully"

# Install MGE analysis tools
echo "Creating conda environment for MGE analysis..."
conda create -n mge_analysis python=3.9 -y
conda install -n mge_analysis -c bioconda abricate mob_suite platon -y
conda install -n mge_analysis -c conda-forge biopython -y
echo "MGE analysis tools installed successfully"

# Install Pangenome tools
echo "Creating conda environment for Pangenome analysis..."
conda create -n pangenome -y
conda install -n pangenome -c bioconda roary -y
conda install -n pangenome -c bioconda fasttree -y
conda install -n pangenome -c conda-forge biopython numpy matplotlib -y
echo "Pangenome tools installed successfully"

# Download Roary plot script
echo "Downloading Roary plot script..."
wget https://raw.githubusercontent.com/sanger-pathogens/Roary/master/contrib/roary_plots.py
chmod +x roary_plots.py
echo "Roary plot script downloaded successfully"

chmod +x install_tools.sh


echo "All tools have been installed successfully!"
