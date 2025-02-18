# fusioncatcher

## Purpose: 
Process 265 TCGA samples through a fusion-gene detection pipeline fusioncatcher

## Project:
Sarcoma

## How-tos:
Running the pipeline
```
nextflow run nf-FusionCatcher.nf  -work-dir s3://bioinformatics-analysis/work -c ./configs/nextflow.config
```

```
[warm up] executor > awsbatch
executor >  awsbatch (3)
[4a/4985d1] process > collectFilesToDownload [100%] 1 of 1 ✔
[b2/8d50e0] process > dowloadAndProcessFastqFiles      [ 50%] 1 of 2
```

Successful run on tiny fastq files.
```
[warm up] executor > awsbatch
executor >  awsbatch (2)
[ee/360a78] process > collectFilesToDownload [100%] 1 of 1 ✔
[1f/904f28] process > dowloadAndProcessFastqFiles      [100%] 1 of 1 ✔
Completed at: 25-May-2019 00:09:19
Duration    : 21m 40s
CPU hours   : (a few seconds)
Succeeded   : 2
```

##  Input files:

### Location

```
s3://bioinformatics-analysis/TCGA/
```

### Example:

```
UNCID_2637215.c8e08e13-b873-437d-94ac-fca3e6cb2e1e.140703_UNC15-SN850_0374_AC4UEAACXX_3_CGATGT.tar.gz
UNCID_2637218.3407b825-5ee0-4f18-ba5c-64cf0893805a.140703_UNC15-SN850_0374_AC4UEAACXX_2_GGCTAC.tar.gz
UNCID_2637226.38acdbd8-a886-47aa-8714-f5cdc5b28dbf.140625_UNC11-SN627_0364_AC4HLGACXX_5_CCGTCC.tar.gz
UNCID_2637247.859f3a2e-27b0-4e2c-9c15-00a2a2f8085d.140603_UNC11-SN627_0360_AC4H72ACXX_2_AGTTCC.tar.gz
UNCID_2637248.aca1bd2b-34c4-4efb-9c54-0f1a411307ba.140611_UNC13-SN749_0355_BC4K53ACXX_4_GATCAG.tar.gz
UNCID_2637249.cf2d53e3-8307-451b-907e-9aec395e7bd1.140611_UNC13-SN749_0355_BC4K53ACXX_4_ATCACG.tar.gz
UNCID_2638477.b5e66e97-14f7-4204-88ad-551abebe1c81.140625_UNC11-SN627_0364_AC4HLGACXX_4_ATGTCA.tar.gz
UNCID_2664323.92bdff6a-3f39-401c-afd7-086ba68d3cf2.141031_UNC11-SN627_0387_AC5FAKACXX_6_GTGGCC.tar.gz
UNCID_2668045.3ab8aba7-9bde-42d3-b95b-e12e2779470b.150108_UNC15-SN850_0402_AC5FTHACXX_3_ATCACG.tar.gz
```

#### Data structure - mapping samples with their corresponding compressed fastq files - for consumption by Nextflow

```
[UNCID_2637215, UNCID_2637215.c8e08e13-b873-437d-94ac-fca3e6cb2e1e.140703_UNC15-SN850_0374_AC4UEAACXX_3_CGATGT.tar.gz]
[UNCID_2637218, UNCID_2637218.3407b825-5ee0-4f18-ba5c-64cf0893805a.140703_UNC15-SN850_0374_AC4UEAACXX_2_GGCTAC.tar.gz]
[UNCID_2637226, UNCID_2637226.38acdbd8-a886-47aa-8714-f5cdc5b28dbf.140625_UNC11-SN627_0364_AC4HLGACXX_5_CCGTCC.tar.gz]
[UNCID_2637247, UNCID_2637247.859f3a2e-27b0-4e2c-9c15-00a2a2f8085d.140603_UNC11-SN627_0360_AC4H72ACXX_2_AGTTCC.tar.gz]
[UNCID_2637248, UNCID_2637248.aca1bd2b-34c4-4efb-9c54-0f1a411307ba.140611_UNC13-SN749_0355_BC4K53ACXX_4_GATCAG.tar.gz]
[UNCID_2637249, UNCID_2637249.cf2d53e3-8307-451b-907e-9aec395e7bd1.140611_UNC13-SN749_0355_BC4K53ACXX_4_ATCACG.tar.gz]
[UNCID_2638477, UNCID_2638477.b5e66e97-14f7-4204-88ad-551abebe1c81.140625_UNC11-SN627_0364_AC4HLGACXX_4_ATGTCA.tar.gz]
[UNCID_2664323, UNCID_2664323.92bdff6a-3f39-401c-afd7-086ba68d3cf2.141031_UNC11-SN627_0387_AC5FAKACXX_6_GTGGCC.tar.gz]
[UNCID_2668045, UNCID_2668045.3ab8aba7-9bde-42d3-b95b-e12e2779470b.150108_UNC15-SN850_0402_AC5FTHACXX_3_ATCACG.tar.gz]
```

### Outputs

The following files are output for every sample processed through the fusioncatcher pipeline.

```
-rw-r--r--  1 ngebremedhin  staff   3.2K May 24 12:14 viruses_bacteria_phages.txt
-rw-r--r--  1 ngebremedhin  staff    66K May 24 12:14 supporting-reads_gene-fusions_STAR.zip
-rw-r--r--  1 ngebremedhin  staff   8.3K May 24 12:14 supporting-reads_gene-fusions_BOWTIE.zip
-rw-r--r--  1 ngebremedhin  staff   186K May 24 12:14 supporting-reads_gene-fusions_BLAT.zip
-rw-r--r--  1 ngebremedhin  staff   864B May 24 12:14 summary_candidate_fusions.txt
-rw-r--r--  1 ngebremedhin  staff   180K May 24 12:14 junk-chimeras.txt
-rw-r--r--  1 ngebremedhin  staff   3.4M May 24 12:14 info.txt
-rw-r--r--  1 ngebremedhin  staff   312K May 24 12:14 fusioncatcher.log
-rw-r--r--  1 ngebremedhin  staff   9.1K May 24 12:14 final-list_candidate-fusion-genes_sequences.txt.zip
-rw-r--r--  1 ngebremedhin  staff   4.6K May 24 12:14 final-list_candidate-fusion-genes.txt
-rw-r--r--  1 ngebremedhin  staff   4.6K May 24 12:14 final-list_candidate-fusion-genes.hg19.txt
-rw-r--r--  1 ngebremedhin  staff    20K May 24 12:14 final-list_candidate-fusion-genes.caption.md.txt
```
#### Candidate fusion genes
```
Very short summary of found candidate fusion genes
==================================================

The input sample contains sequencing reads mapping on: 'NC 029073.1 Geobacillus virus E3', 'NC 001499.1 Abelson murine leukemia virus', 'NC 001405.1 Human adenovirus C'.

Found 8 fusion gene(s), which are as follows:
  * C19MC--RPLP1  (reciprocal fusion; already known fusion; probably false positive)
  * MECOM--RPL22  (reciprocal fusion; already known fusion; probably false positive)
  * SIX3--AC012354.1  (readthrough)
  * RBM3--TOX4  (reciprocal fusion)
  * HSDL1--POLR2J3
  * C8ORF59--PCBP1-AS1
  * MIR3936HG--P4HA2  (readthrough)
  * PPIP5K1--CATSPER2  (already known fusion; probably false positive)

Found 16 fusion transcript(s).

For more detailed information regarding these candidate fusions, see text file 'final-list_candidate-fusion-genes.txt'.
```

Table 1 - Columns description for file `final-list_candidate-fusion-genes.txt`

| **Column** | **Description** |
|:-----------|:----------------|
| **Gene\_1\_symbol(5end\_fusion\_partner)** | Gene symbol of the 5' end fusion partner |
| **Gene\_2\_symbol\_2(3end\_fusion\_partner)** | Gene symbol of the 3' end fusion partner |
| **Gene\_1\_id(5end\_fusion\_partner)** | Ensembl gene id of the 5' end fusion partner |
| **Gene\_2\_id(3end\_fusion\_partner)** | Ensembl gene id of the 3' end fusion partner |
| **Exon\_1\_id(5end\_fusion\_partner)** | Ensembl exon id of the 5' end fusion exon-exon junction |
| **Exon\_2\_id(3end\_fusion\_partner)** | Ensembl exon id of the 3' end fusion exon-exon junction |
| **Fusion\_point\_for\_gene\_1(5end\_fusion\_partner)** | Chromosomal position of the 5' end of fusion junction (chromosome:position:strand); 1-based coordinate |
| **Fusion\_point\_for\_gene\_2(3end\_fusion\_partner)** | Chromosomal position of the 3' end of fusion junction (chromosome:position:strand); 1-based coordinate |
| **Spanning\_pairs** | Count of pairs of reads supporting the fusion (**including** also the multimapping reads) |
| **Spanning\_unique\_reads** | Count of unique reads (i.e. unique mapping positions) mapping on the fusion junction. Shortly, here are counted all the reads which map on fusion junction minus the PCR duplicated reads. |
| **Longest\_anchor\_found** | Longest anchor (hangover) found among the unique reads mapping on the fusion junction |
| **Fusion\_finding\_method** | Aligning method used for mapping the reads and finding the fusion genes. Here are two methods used which are: (i) **BOWTIE** = only Bowtie aligner is used for mapping the reads on the genome and exon-exon fusion junctions, (ii) **BOWTIE+BLAT** = Bowtie aligner is used for mapping reads on the genome and BLAT is used for mapping reads for finding the fusion junction,  (iii) **BOWTIE+STAR** = Bowtie aligner is used for mapping reads on the genome and STAR is used for mapping reads for finding the fusion junction, (iv) **BOWTIE+BOWTIE2** = Bowtie aligner is used for mapping reads on the genome and Bowtie2 is used for mapping reads for finding the fusion junction, and (v) **BOWTIE+BWA** = Bowtie aligner is used for mapping reads on the genome and Bowtie2 is used for mapping reads for finding the fusion junction. |
| **Fusion\_sequence** | The inferred fusion junction (the asterisk sign marks the junction point) |
| **Fusion\_description** | Type of the fusion gene (see the Table 2) |
| **Counts\_of\_common\_mapping\_reads** | Count of reads mapping simultaneously on both genes which form the fusion gene. This is an indication how similar are the DNA/RNA sequences of the genes forming the fusion gene (i.e. what is their homology because highly homologous genes tend to appear show as candidate fusion genes). In case of completely different sequences of the genes involved in forming a fusion gene then here it is expected to have the value zero. |
| **Predicted\_effect** | Predicted effect of the candidate fusion gene using the annotation from Ensembl database. This is shown in format **effect\_gene\_1**/**effect\_gene\_2**, where the possible values for effect\_gene\_1 or effect\_gene\_2 are: **intergenic**, **intronic**, **exonic(no-known-CDS)**, **UTR**, **CDS(not-reliable-start-or-end)**, **CDS(truncated)**, or **CDS(complete)**. In case that the fusion junction for both genes is within their CDS (coding sequence) then only the values **in-frame** or **out-of-frame** will be shown. |
| **Predicted\_fused\_transcripts** | All possible known fused transcripts in format ENSEMBL-TRANSCRIPT-1:POSITION-1/ENSEMBLE-TRANSCRIPT-B:POSITION-2, where are fused the sequence 1:POSITION-1 of transcript ENSEMBL-TRANSCRIPT-1 with sequence POSITION-2:END of transcript ENSEMBL-TRANSCRIPT-2 |
| **Predicted\_fused\_proteins** | Predicted amino acid sequences of all possible fused proteins (separated by ";").  |

Table 2 - Labels used to describe the found fusion genes (column *Fusion\_ description* from file `final-list_candidate-fusion-genes.txt`)

| **Fusion\_description** | **Description** |
|:------------------------|:----------------|
| **1000genomes**             | fusion gene has been seen in a healthy sample. It has been found in [RNA-seq data from some samples from 1000 genomes project](http://dx.doi.org/10.1371/journal.pone.0104567). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **18cancers**              | fusion gene found in a RNA-seq dataset of 18 types of cancers from 600 tumor samples published [here](http://dx.doi.org/10.1073/pnas.1606220113). |
| **adjacent**           | both genes forming the fusion are adjacent on the genome (i.e. same strand and there is no other genes situated between them on the same strand)|
| **antisense**           | one or both genes is a gene coding for [antisense RNA](http://en.wikipedia.org/wiki/Antisense_RNA)|
| **banned**              | fusion gene is on a list of known false positive fusion genes. These were found with very strong supporting data in healthy samples (i.e. it showed up in file final-list\_candidate\_fusion\_genes.txt). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **bodymap2**            | fusion gene is on a list of known false positive fusion genes. It has been found in healthy human samples collected from 16 organs from  [Illumina BodyMap2 RNA-seq database](http://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-513/). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **cacg**                | known conjoined genes (that is fusion genes found in samples from healthy patients) from the [CACG](http://cgc.kribb.re.kr/map/) database (please see CACG database for more information). *A candidate fusion gene having this label has a very high probability of being a false positive in case that one looks for fusion genes specific to a disease.*|
| **cell\_lines**         | known fusion gene from paper: C. Klijn et al., A comprehensive transcriptional portrait of human cancer cell lines, Nature Biotechnology, Dec. 2014, [DOI:10.1038/nbt.3080](http://dx.doi.org/10.1038/nbt.3080) |
| **cgp**                 | known fusion gene from the [CGP](http://www.sanger.ac.uk/genetics/CGP/Census/) database |
| **chimerdb2**           | known fusion gene from the [ChimerDB 2](http://ercsb.ewha.ac.kr/FusionGene/) database|
| **chimerdb3kb**           | known fusion gene from the [ChimerDB 3 KB (literature curration)](http://ercsb.ewha.ac.kr/FusionGene/) database |
| **chimerdb3pub**           | known fusion gene from the [ChimerDB 3 PUB (PubMed articles)](http://ercsb.ewha.ac.kr/FusionGene/) database |
| **chimerdb3seq**           | known fusion gene from the [ChimerDB 3 SEQ (TCGA)](http://ercsb.ewha.ac.kr/FusionGene/) database |
| **conjoing**            | known conjoined genes (that is fusion genes found in samples from healthy patients) from the [ConjoinG](http://metasystems.riken.jp/conjoing/) database (please use ConjoinG database for more information regarding the fusion gene). *A candidate fusion gene having this label has a very high probability of being a false positive in case that one looks for fusion genes specific to a disease.* |
| **cosmic**              | known fusion gene from the [COSMIC](http://cancer.sanger.ac.uk/cancergenome/projects/cosmic/) database (please use COSMIC database for more information regarding the fusion gene) |
| **cta**           | one gene or both genes is CTA gene (that is that the gene name starts with **CTA-**). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **ctb**           | one gene or both genes is CTB gene (that is that the gene name starts with **CTB-**). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **ctc**           | one gene or both genes is CTC gene (that is that the gene name starts with **CTC-**). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **ctd**           | one gene or both genes is CTD gene (that is that the gene name starts with **CTD-**). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **distance1000bp**      | both genes are on the same strand and they are less than 1 000 bp apart. *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **distance100kbp**      | both genes are on the same strand and they are less than 100 000 bp apart. *A candidate fusion gene having this label has a higher probability than expected of being a false positive.* |
| **distance10kbp**       | both genes are on the same strand and they are less than 10 000 bp apart. *A candidate fusion gene having this label has a higher probability than expected of being a false positive.* |
| **duplicates**          | both genes involved in the fusion gene are [paralog](http://en.wikipedia.org/wiki/Paralog#Paralogy) for each other. For more see [Duplicated Genes Database (DGD) database](http://dgd.genouest.org/) . *A candidate fusion gene having this label has a higher probability than expected of being a false positive.* |
| **exon-exon**          | the fusion junction point is exactly at the known exon's borders of both genes forming the candidate fusion |
| **ensembl\_fully\_overlapping** | the genes forming the fusion gene are fully overlapping according to Ensembl database. *A candidate fusion gene having this label has a very high probability of being a false positive.*|
| **ensembl\_partially\_overlapping** | the genes forming the fusion gene are partially overlapping (on same strand or on different strands) according the Ensembl database. *A candidate fusion gene having this label has a good probability of being a false positive.</i> </font> |
| **ensembl\_same\_strand\_overlapping** | the genes forming the fusion gene are fully/partially overlapping and are both on the same strand according to Ensembl database. *A candidate fusion gene having this label has a very high probability of being a false positive (this is most likely and alternative splicing event).</i> </font> |
| **fragments** | the genes forming the fusion are supported by only and only one fragment of RNA. *A candidate fusion gene having this label has a medium probability of being a false positive.*|
| **gliomas**              | fusion gene found in a RNA-seq dataset of 272 glioblastoms published [here](http://dx.doi.org/10.1101/gr.165126.113). |
| **gtex**             | fusion gene has been seen in a healthy sample. It has been found in [GTEx database](http://www.gtexportal.org/home/) of healthy tissues (thru [FusionAnnotator](https://github.com/FusionAnnotator/FusionAnnotator)). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **healthy**             | fusion gene has been seen in a healthy sample. These have been found in healthy samples but the support for them is less strong (i.e. paired reads were found to map on both genes but no fusion junction was found) than in the case of **banned** label (i.e. it showed up in file preliminary list of candidate fusion genes). Also genes which have some degree of sequence similarity may show up marked like this.*A candidate fusion gene having this label has a small probability of being a false positive in case that one looks for fusion genes specific to a disease.* |
| **hpa**             | fusion gene has been seen in a healthy sample. It has been found in [RNA-seq database of 27 healthy tissues](http://dx.doi.org/10.1074/mcp.M113.035600). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **known**       | fusion gene which has been previously reported or published in scientific articles/reports/books/abstracts/databases indexed by [Google](http://www.google.com/), [Google Scholar](http://scholar.google.com/), [PubMed](http://www.ncbi.nlm.nih.gov/pubmed), etc. This label has only the role to answer with YES or NO the question "has ever before a given (candidate) fusion gene been published or reported?". This label does not have in anyway the role to provide the original references to the original scientific articles/reports/books/abstracts/databases for a given fusion gene. |
| **lincrna**             | one or both genes is a [lincRNA](http://en.wikipedia.org/wiki/Long_non-coding_RNA) |
| **matched-normal**      | candidate fusion gene (which is supported by paired reads mapping on both genes and also by reads mapping on the junction point) was found also in the matched normal sample given as input to the command line option '--normal' |
| **metazoa**             | one or both genes is a metazoa\_srp gene [Metazia\_srp](http://www.genecards.org/index.php?path=/Search/keyword/metazoa_srp) |
| **mirna**               | one or both genes is a [miRNA](http://en.wikipedia.org/wiki/MicroRNA) |
| **mt**                  | one or both genes are situated on [mitochondrion](http://en.wikipedia.org/wiki/Mitochondrion). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **mX** (where X is a number) | count of pairs of reads supporting the fusion (**excluding** the mutimapping reads). |
| **non\_cancer\_tissues**   | fusion gene which has been previously reported/found in non-cancer tissues and cell lines in [Babiceanu et al, Recurrent chimeric fusion RNAs in non-cancer tissues and cells, Nucl. Acids Res. 2016](http://nar.oxfordjournals.org/content/early/2016/02/01/nar.gkw032.abstract). These are considered as non-somatic mutation and therefore they may be skipped and not reported. |
| **non\_tumor\_cells**   | fusion gene which has been previously reported/found in non-tumor cell lines, like for example HEK293. These are considered as non-somatic mutation and therefore may be skipped and not reported. |
| **no\_protein** | one or both genes have no known protein product |
| **oesophagus**              | fusion gene found in a oesophageal tumors from TCGA samples, which are published [here](http://dx.doi.org/10.1038/nature20805). |
| **oncogene**            | one gene or both genes are a known [oncogene](http://en.wikipedia.org/wiki/Oncogene) according to [ONGENE database](https://doi.org/10.1016/j.jgg.2016.12.004) |
| **cancer**            | one gene or both genes are cancer associated according to [Cancer Gene database](http://www.bushmanlab.org/links/genelists) |
| **tumor**            | one gene or both genes are proto-oncogene or tumor suppresor gene according to [UniProt database](http://www.uniprot.org) |
| **pair\_pseudo\_genes** | one gene is the other's [pseudogene](http://en.wikipedia.org/wiki/Pseudogene). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **pancreases**           | known fusion gene found in pancreatic tumors from article: P. Bailey et al., Genomic analyses identify molecular subtypes of pancreatic cancer, Nature, Feb. 2016, http://dx.doi.org/110.1038/nature16965 |
| **paralogs**            | both genes involved in the fusion gene are  [paralog](http://en.wikipedia.org/wiki/Paralog#Paralogy) for each other (most likely this is a false positive fusion gene). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **multi**            | one of the genes of both have multi-mapping reads mapping (which map simultaneously also on other gene/genes |
| **partial-matched-normal** | candidate fusion gene (which is supported by paired reads mapping on both genes **but** _no_ reads were found which map on the junction point) was found also in the matched normal sample given as input to the command line option '--normal'. This is much weaker than **matched-normal**. |
| **prostates**           | known fusion gene found in 150 prostate tumors RNAs from paper: D. Robison et al, Integrative Clinical Genomics of Advanced Prostate Cancer, Cell, Vol. 161, May 2015, http://dx.doi.org/10.1016/j.cell.2015.05.001 |
| **pseudogene**          | one or both of the genes is a [pseudogene](http://en.wikipedia.org/wiki/Pseudogene) |
| **readthrough**         | the fusion gene is a readthrough event (that is both genes forming the fusion are on the same strand and there is no known gene situated in between); Please notice, that many of readthrough fusion genes might be false positive fusion genes due to errors in Ensembl database annotation (for example, one gene is annotated in Ensembl database as two separate genes). *A candidate fusion gene having this label has a high probability of being a false positive.* |
| **refseq\_fully\_overlapping** | the genes forming the fusion gene are fully overlapping according to RefSeq NCBI database. *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **refseq\_partially\_overlapping** | the genes forming the fusion gene are partially overlapping (on same strand or on different strands) according the RefSeq NCBI. *A candidate fusion gene having this label has a good probability of being a false positive.</i> </font> |
| **refseq\_same\_strand\_overlapping** | the genes forming the fusion gene are fully/partially overlapping and are both on the same strand according to RefSeq NCBI database. *A candidate fusion gene having this label has a very high probability of being a false positive (this is most likely and alternative splicing event).</i> </font> |
| **ribosomal**  | one or both gene is a gene encoding for [ribosomal protein](http://en.wikipedia.org/wiki/Ribosomal_protein) |
| **rp11**          | one gene or both genes is RP11 gene (that is that the gene name starts with **RP11-**). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **rp**            | one gene or both genes is RP?? gene (that is that the gene name starts with **RP??-**) where ? is a digit. *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **rrna**                | one or both genes is a [rRNA](http://en.wikipedia.org/wiki/Ribosomal_RNA).  *A candidate fusion gene having this label has a very high probability of being a false positive.*|
| **short\_distance**     | both genes are on the same strand and they are less than X bp apart, where X is set using the option '--dist-fusion' and by default it is 200 000 bp. *A candidate fusion gene having this label has a higher probability than expected of being a false positive.* |
| **similar\_reads**      | both genes have the same reads which map simultaneously on both of them (this is an indicator of how similar are the sequences of both genes; ideally this should be zero or as close to zero as possible for a real fusion). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **similar\_symbols**    | both genes have the same or very similar gene names (for example: RP11ADF.1 and RP11ADF.2). *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **snorna**              | one or both genes is a [snoRNA](http://en.wikipedia.org/wiki/Small_nucleolar_RNA) |
| **snrna**               | one or both genes is a [snRNA](http://en.wikipedia.org/wiki/Small_nuclear_RNA) |
| **tcga**                | known fusion gene from the [TCGA](https://tcga-data.nci.nih.gov/tcga/) database (please use Google for more information regarding the fusion gene) |
| **ticdb**               | known fusion gene from the [TICdb](http://www.unav.es/genetica/TICdb/) database (please use TICdb database for more information regarding the fusion gene) |
| **trna**                | one or both genes is a [tRNA](http://en.wikipedia.org/wiki/Transfer_RNA) |
| **ucsc\_fully\_overlapping** | the genes forming the fusion gene are fully overlapping according to UCSC database. *A candidate fusion gene having this label has a very high probability of being a false positive.* |
| **ucsc\_partially\_overlapping** | the genes forming the fusion gene are partially overlapping (on same strand or on different strands) according the UCSC database.  *A candidate fusion gene having this label has a good probability of being a false positive.</i> </font> |
| **ucsc\_same\_strand\_overlapping** | the genes forming the fusion gene are fully/partially overlapping and are both on the same strand according to UCSC database. *A candidate fusion gene having this label has a very high probability of being a false positive (this is most likely and alternative splicing event).</i> </font> |
| **yrna**                | one or both genes is a [Y RNA](http://en.wikipedia.org/wiki/Y_RNA) |
