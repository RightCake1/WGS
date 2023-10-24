*Seqkit*

[Source page](https://bioinf.shenwei.me/seqkit/)
[Tutorial](https://bioinf.shenwei.me/seqkit/tutorial/)


Some basic commands 

`cat contigs.fa` 
This is to display your sequence 

`seqkit stat hsa.fa` or `seqkit stats *.f{a,q}.gz -a`
This is see basic stats

`seqkit sort --by-length hsa.fa`
This is to sort by length

`seqkit split --by-id hsa.fa split contig to separate`
To split your sequence to new text files according to contig# 

First 12 bases
`seqkit subseq -r 1:12 .fasta`

Last 12 bases
`seqkit subseq -r -12:-1 .fasta`

Subsequences without first and last 12 bases
`seqkit subseq -r 13:-13 .fasta.fasta`

`seqkit fx2tab seqs.msa.fa`
This is to Convert FASTA format to tabular format.
