% Inclass assignment 9

% The accession number for human NOTCH1 mRNA is AF308602
% 1. Read the information from this entry into matlab
%XiaotongLu:
Gene=getgenbank('AF308602')
% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database
%XiaotongLu:
seque=Gene.Sequence(1:500)
[requestID,requestTime]=blastncbi(seque,'blastn','Database','refseq_rna');
blast_data=getblast(requestID,'WaitTime',requestTime)
% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 
%XiaotongLu:
Gene1_Score=blast_data.Hits(1).HSPs.Score
Gene1_identify=blast_data.Hits(1).HSPs.Identities
Gene1_Alignment=blast_data.Hits(1).HSPs.Alignment
Gene1_fraction=Gene1_identify.Match/(500-Gene1_identify.Match)

Gene2_Score=blast_data.Hits(6).HSPs.Score
Gene2_identify=blast_data.Hits(6).HSPs.Identities
Gene2_Alignment=blast_data.Hits(6).HSPs.Alignment
Gene2_fraction=Gene2_identify.Match/(500-Gene2_identify.Match)

Gene3_Score=blast_data.Hits(7).HSPs.Score
Gene3_identify=blast_data.Hits(7).HSPs.Identities
Gene3_Alignment=blast_data.Hits(7).HSPs.Alignment
Gene3_fraction=Gene3_identify.Match/(500-Gene3_identify.Match)
% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 
[requestID,requestTime]=blastncbi(seque,'blastn','Database','est_human');
blast_data=getblast(requestID,'WaitTime',requestTime)
The are 50 hits I find in est_human database. Except the 1 hits, other hits is quite short which means
the blast function may compare the genes in the est_human database with our 500bp sequence and give back the list of genes which 
contains the most similar part with our 500bp sequence even though the lenght of these genes is really short like 40bp and so on.And 
the function will order these genes from large score to small score.
