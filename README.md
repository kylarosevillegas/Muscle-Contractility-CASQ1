# Molecular Mechanisms of Muscle Contractility: CASQ1 Protein and Mutation Analysis

## 1. Project Information

- **Student Name:** Kyla Rose D. Villegas
- **Course:** BIO 300 – Cell and Molecular Biology
- **Section:** B
- **Activity:** Molecular Mechanisms of Muscle Contractility
- **Assignment:** Individual Laboratory Activity
- **Gene:** CASQ1
- **Gene Name:** Calsequestrin 1
- **Organism:** *Homo sapiens*
- **NCBI Gene ID:** 844
- **Reference Transcript:** NM_001231.5
- **Reference Protein:** NP_001222.3
- **Protein Length:** 396 amino acids
- **DNA Variant:** c.731A>G
- **Protein Variant:** p.Asp244Gly (D244G)
- **ClinVar Variation ID:** 183021
- **ClinVar Accession:** VCV000183021.10
- **Date Accessed:** October 28, 2026

## 2. Research Question

How does CASQ1 contribute to skeletal muscle function, and what evidence suggests that the p.Asp244Gly (D244G) variant may affect calcium handling and muscle integrity?

## 3. Objectives

1. Retrieve the human CASQ1 reference protein sequence from NCBI using R.
2. Calculate protein length and amino-acid composition.
3. Generate figures showing amino-acid composition and variant position.
4. Review the ClinVar classification and published evidence for the assigned variant.
5. Explain the possible molecular consequences of the variant, including limitations and future validation.

## 4. Methods and Reproducibility

### Step 1: Prepare the R environment

Install the required packages in RStudio if they are not already installed.

```r
install.packages(c("rentrez", "ggplot2"))
```

The `rentrez` package supports access to NCBI records, while `ggplot2` is used to create figures.

### Step 2: Retrieve the CASQ1 protein sequence

Run `analysis.R` to retrieve the CASQ1 reference protein associated with accession NP_001222.3. The sequence is saved as:

`data/CASQ1_protein.fasta`

### Step 3: Calculate protein characteristics

The script calculates protein length and amino-acid counts and percentages. Results are saved in the `results/` directory, including `amino_acid_composition.csv` and the protein summary files.

### Step 4: Generate figures

The script generates two figures:

- `figures/01_amino_acid_composition.png`
- `figures/02_variant_position.png`

Figure 1 displays amino-acid composition. Figure 2 shows the location of residue 244 within the 396-amino-acid reference protein.

### Step 5: Review the assigned variant

The variant was reviewed using ClinVar and published literature. The assigned transcript and variant were retained to maintain consistency with the laboratory instructions.

### Step 6: Reproduce the analysis

1. Install R and RStudio.
2. Install the required packages.
3. Download or clone this repository.
4. Open the project directory as the working directory.
5. Run the complete script:

```r
source("analysis.R")
```

Alternatively, run this command in a terminal opened in the project directory:

```bash
Rscript analysis.R
```

These commands assume the script and folder structure remain unchanged. Run the script from the project root so relative output paths resolve correctly. If an NCBI request fails temporarily, retry the failed step rather than changing the assigned gene or variant.

## 5. Results

### 5.1 Protein length and amino-acid composition

The retrieved CASQ1 reference protein NP_001222.3 contains 396 amino acids.

The three most abundant amino acids were:

| Amino acid | Count | Percentage |
|---|---:|---:|
| Glutamic acid (E) | 56 | 14.14% |
| Aspartic acid (D) | 48 | 12.12% |
| Leucine (L) | 40 | 10.10% |

These results describe the amino-acid composition of the reference sequence. They do not directly measure protein activity, three-dimensional structure, calcium-binding ability, or the effect of a mutation.

### 5.2 Figure 1: Amino-acid composition

![CASQ1 amino-acid composition](figures/01_amino_acid_composition.png)

The bar plot displays the distribution of amino acids in the CASQ1 reference protein. Glutamic acid is the most abundant amino acid in the analyzed sequence.

### 5.3 Figure 2: Variant position

![CASQ1 variant position](figures/02_variant_position.png)

The second figure marks the p.Asp244Gly (D244G) variant at amino-acid position 244 in the 396-amino-acid reference protein. The marker identifies the sequence location and does not independently prove a structural or functional effect.

### 5.4 Generated files

**Data**
- `data/CASQ1_protein.fasta` — retrieved protein sequence.

**Results**
- `results/amino_acid_composition.csv` — amino-acid counts and percentages.
- `results/clinvar_variant_notes.txt` — ClinVar classification and evidence notes.
- `results/gene_summary.txt` — gene summary and retrieved NCBI record information.
- `results/protein_accession.txt` — protein accession information.
- `results/protein_length.txt` — protein length.
- `results/source_and_accession_notes.txt` — source and accession notes.
- `results/top_three_amino_acids.txt` — three most abundant amino acids.
- `results/transcript_genbank_record.txt` — transcript record information.

**Figures**
- `figures/01_amino_acid_composition.png`
- `figures/02_variant_position.png`

## 6. Variant Interpretation

The assigned variant is **CASQ1 NM_001231.5:c.731A>G, p.Asp244Gly (D244G)**, recorded in ClinVar as Variation ID 183021.

When checked on October 28, 2026, ClinVar's aggregate classification was **Pathogenic**, with a review status of criteria provided by multiple submitters and no conflicts among the submissions contributing to that classification.

The substitution replaces aspartic acid, an acidic amino acid, with glycine, a much smaller amino acid, at position 244. Published studies have reported altered CASQ1 polymerization, protein aggregation, and changes in sarcoplasmic-reticulum calcium release associated with this variant. These findings support a possible connection between altered calsequestrin-1 behavior and muscle dysfunction.

Computational predictions have not been completely consistent. Therefore, the classification should be interpreted alongside experimental findings, clinical evidence, and the limitations of each type of evidence.

## 7. Scientific Discussion (300–500 Words)

Calsequestrin-1, encoded by CASQ1, is an important calcium-binding protein found in the sarcoplasmic reticulum of skeletal muscle. It helps store calcium inside the sarcoplasmic reticulum so calcium can be released when a muscle fiber is stimulated. Calcium release activates the contractile machinery, while calcium reuptake helps the muscle relax. Changes affecting calsequestrin-1 may therefore interfere with calcium regulation and normal muscle function.

The reference CASQ1 protein analyzed in this project is NP_001222.3 and contains 396 amino acids. The amino-acid composition analysis identified glutamic acid as the most abundant amino acid, with 56 residues (14.14%), followed by aspartic acid with 48 residues (12.12%) and leucine with 40 residues (10.10%). These results describe the composition of the reference protein but do not directly measure its three-dimensional structure, calcium-binding capacity, stability, or biological activity.

The assigned variant, NM_001231.5:c.731A>G (p.Asp244Gly), replaces aspartic acid with glycine at amino-acid position 244. ClinVar's aggregate classification was Pathogenic when checked on October 28, 2026. Published studies have reported altered CASQ1 polymerization, formation of larger protein aggregates, and changes in calcium release associated with this variant. These observations suggest a possible mechanism through which abnormal calsequestrin-1 behavior could disturb calcium handling and contribute to muscle disease. Clinical reports provide additional evidence of an association between CASQ1 variants and myopathy.

Nevertheless, the evidence must be interpreted carefully. A clinical association does not establish every molecular step leading to disease, and computational predictions have not been fully consistent for this variant. The amino-acid composition chart and variant-position plot are descriptive analyses; neither directly demonstrates a structural defect or proves that the substitution causes particular clinical features. The pathogenic classification reflects the available submitted evidence, not experiments performed in this project.

A useful follow-up experiment would compare normal and D244G calsequestrin-1 under controlled conditions. Protein polymerization and aggregation could be measured, while calcium-release assays in an appropriate muscle-cell model could test whether the variant changes calcium handling. Structural analysis using a suitable experimental or predicted protein model could also examine the environment around residue 244. Together, these approaches would help connect the sequence change to protein behavior and muscle function more directly.

## 8. Limitations and Proposed Validation

- This project analyzes a reference sequence and its amino-acid composition; it does not directly measure protein expression or activity.
- The variant-position plot identifies residue 244 but does not prove a structural or functional effect.
- ClinVar classifications and supporting evidence may change over time.
- Computational predictions may disagree and should not be treated as experimental proof.
- A dedicated structural or functional-domain analysis is not represented by the two current figures.

**Proposed validation:** Compare wild-type and D244G CASQ1 using protein polymerization or aggregation assays and a suitable calcium-release assay. A complementary structural analysis could examine residue 244 and its surrounding environment using an appropriate experimental or predicted protein model.

## 9. References and Data Sources

1. **NCBI Gene.** CASQ1, Gene ID 844.  
   https://www.ncbi.nlm.nih.gov/gene/844/

2. **NCBI Protein.** CASQ1 reference protein NP_001222.3.  
   https://www.ncbi.nlm.nih.gov/protein/NP_001222.3

3. **NCBI Nucleotide.** CASQ1 reference transcript NM_001231.5.  
   https://www.ncbi.nlm.nih.gov/nuccore/NM_001231.5

4. **NCBI ClinVar.** CASQ1 variant c.731A>G (p.Asp244Gly), Variation ID 183021.  
   https://www.ncbi.nlm.nih.gov/clinvar/variation/183021/

5. Rossi et al. (2014). PMID: 25116801.  
   https://pubmed.ncbi.nlm.nih.gov/25116801/

6. Lewis et al. (2015). PMID: 26416891.  
   https://pubmed.ncbi.nlm.nih.gov/26416891/

7. Di Blasi et al. (2015). PMID: 26136523.  
   https://pubmed.ncbi.nlm.nih.gov/26136523/

8. **UniProt.** Calsequestrin-1, accession P31415.  
   https://www.uniprot.org/uniprotkb/P31415/entry

9. **RCSB Protein Data Bank.**  
   https://www.rcsb.org/

10. **AlphaFold Protein Structure Database.**  
    https://alphafold.ebi.ac.uk/

11. **rentrez documentation.**  
    https://docs.ropensci.org/rentrez/

**Database access date:** October 28, 2026.

## 10. Conclusion

This project used R to retrieve the CASQ1 reference protein, calculate amino-acid composition, generate figures, and organize variant evidence from ClinVar and published literature. The D244G variant has a current aggregate ClinVar classification of Pathogenic, and published findings suggest possible effects on CASQ1 polymerization, aggregation, and calcium handling. Further structural and functional experiments are needed to test these mechanisms directly.
