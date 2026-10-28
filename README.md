# Molecular Mechanisms of Muscle Contractility: CASQ1 Variant Analysis

**Student:** Kyla Rose D. Villegas  
**Course:** BIO 300 – Cell and Molecular Biology  
**Section:** B

## 1. Introduction

Calsequestrin 1 (CASQ1) is a calcium-binding protein found in the sarcoplasmic reticulum of skeletal muscle cells. It helps store calcium, which is important for normal muscle contraction and relaxation.

This project examines the CASQ1 missense variant **c.731A>G (p.Asp244Gly; D244G)** and its possible effects on protein function and muscle physiology.

## 2. Gene and Variant Information

- **Gene:** CASQ1
- **NCBI Gene ID:** 844
- **Transcript accession:** NM_001231.5
- **Protein accession:** NP_001222.3
- **Protein length:** 396 amino acids
- **DNA variant:** c.731A>G
- **Protein variant:** p.Asp244Gly (D244G)
- **ClinVar Variation ID:** 183021
- **ClinVar accession:** VCV000183021.10
- **ClinVar record:** https://www.ncbi.nlm.nih.gov/clinvar/variation/183021/

The variant changes aspartic acid (Asp, D) to glycine (Gly, G) at amino acid position 244.

## 3. Project Objectives

1. Retrieve and examine the CASQ1 protein sequence.
2. Determine the amino acid composition of the protein.
3. Identify the position of the D244G variant in the protein sequence.
4. Review available clinical and scientific evidence about the variant.
5. Explain the possible relationship between CASQ1 changes, calcium regulation, and muscle function.

## 4. Methods

The CASQ1 sequence and related gene information were obtained from NCBI resources. The protein sequence was analyzed using R to calculate amino acid composition and generate figures.

ClinVar was consulted to review the variant's clinical classification. Published research was used to discuss possible effects on protein behavior and calcium regulation.

The analysis includes the following files:

- `analysis.R` — R analysis script
- `data/` — input sequence data
- `figures/` — generated figures
- `results/` — output tables and notes

## 5. Results

### Amino Acid Composition

The three most abundant amino acids in the analyzed CASQ1 protein sequence were:

| Amino acid | Residues | Percentage |
|---|---:|---:|
| Glutamic acid (E) | 56 | 14.14% |
| Aspartic acid (D) | 48 | 12.12% |
| Leucine (L) | 40 | 10.10% |

Figure 1 shows the amino acid composition of CASQ1.

![CASQ1 amino acid composition](figures/01_amino_acid_composition.png)

### Variant Position

The D244G variant occurs at amino acid position 244 in the 396-amino-acid protein.

Figure 2 shows the location of the variant within the protein sequence. This figure indicates the variant's position but does not independently demonstrate its structural or functional effect.

![CASQ1 variant position](figures/02_variant_position.png)

## 6. Clinical and Biological Significance

The ClinVar record for this variant reports an aggregate classification of **Pathogenic**. This classification should be interpreted alongside the evidence and review information available in the ClinVar record.

Aspartic acid is negatively charged, whereas glycine is small and uncharged. Replacing aspartic acid with glycine may affect local protein interactions. Published research on CASQ1 variants has reported changes in protein polymerization, aggregate formation, and sarcoplasmic reticulum calcium release.

These findings provide a possible biological connection between CASQ1 variation and abnormal muscle function. However, the sequence-position figure alone cannot establish the mechanism, and computational predictions may differ. The effects should be discussed using experimental findings and appropriate scientific references.

## 7. Limitations

This analysis examines the protein sequence, amino acid composition, variant position, and available clinical information. The two figures do not provide a detailed three-dimensional structural analysis or a complete functional-domain analysis. Additional structural or domain evidence would be needed to examine the variant's position in the context of the protein's structure.

## 8. Reproducibility

The project files are organized into `data/`, `figures/`, and `results/`, with the analysis script in the repository root.

Before running `analysis.R`, open the repository root as the working directory in RStudio. The script should use the existing project folders rather than creating another nested `Muscle_Contractility_CASQ1` folder. Review the output-writing code before rerunning the script to ensure that manually completed ClinVar notes are not overwritten.

## 9. References

1. NCBI Gene: CASQ1. https://www.ncbi.nlm.nih.gov/gene/844/
2. NCBI ClinVar: CASQ1 variant, Variation ID 183021. https://www.ncbi.nlm.nih.gov/clinvar/variation/183021/
3. NCBI Nucleotide: NM_001231.5. https://www.ncbi.nlm.nih.gov/nuccore/NM_001231.5
4. NCBI Protein: NP_001222.3. https://www.ncbi.nlm.nih.gov/protein/NP_001222.3

Additional research articles used for interpretation should be listed here with their full bibliographic details and links.
