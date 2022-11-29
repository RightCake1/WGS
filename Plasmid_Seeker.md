**Plasmid Seeker**

A. *Deeplasmid* 

[Source Page](https://github.com/wandreopoulos/deeplasmid)

*Requires Docker account*

*Docker login issues* - 

[Fix for login](https://phoenixnap.com/kb/docker-permission-denied#ftoc-heading-4)
 
Docker issue may come again and again so use the fix whenever needed 

(Used method 3)

Code - 

`sudo groupadd -f docker`

`sudo usermod -aG docker $USER`

`newgrp docker`

`groups`

*Steps*

1. Need to bring fasta file to home 

Code - 

`docker run -it -v /home/mustafa/M01094-002.fasta:/srv/jgi-ml/classifier/dl/in.fasta -v`

`/home/mustafa/DeeplasmidResults:/srv/jgi-ml/classifier/dl/outdir billandreo/deeplasmid feature_DL_plasmid_predict.sh in.fasta outdir` 

Results example - 47 NODE_16_length_67951_cov_53.067574 decision=MAIN, avr score: 0.000 +/- 0.000  len=68.0k samples=180
Counts: Plasm=4  Ambig=0  Main=43  nCount=47

B. *Platon*
 
[Source Page](https://github.com/oschwengers/platon)

Steps 

1. Need to bring fasta files to home

2. Create environment for platon

Code - 

`conda activate platon`

3. Code for platon 

`platon --db db --output PlatonResults M00371-002.fasta`