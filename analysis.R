
# ============================================================
# MOLECULAR MECHANISMS OF MUSCLE CONTRACTILITY
# Assignment 27: CASQ1
# Variant: NM_001231.5:c.731A>G (p.Asp244Gly)
# ClinVar Variation ID: 183021
# ============================================================

# STEP 1. INSTALL AND LOAD PACKAGES
# install.packages() is needed only if a package is not installed.


# CREATE PROJECT FOLDERS
# Run analysis.R from the repository root.

required_folders <- c("data", "results", "figures")

for (folder in required_folders) {
  if (!dir.exists(folder)) {
    dir.create(folder, recursive = TRUE)
  }
}

cat("Project folders are ready.\n")


library(rentrez)
library(ggplot2)
library(httr)

options(timeout = 120)

# ASSIGNED INFORMATION
gene_symbol <- "CASQ1"
transcript_accession <- "NM_001231.5"
clinvar_id <- "183021"
variant_protein <- "p.Asp244Gly"
variant_position <- 244


# STEP 2. RETRIEVE THE NCBI GENE RECORD
# Search specifically for the human CASQ1 gene.

cat("\nSTEP 2: Searching NCBI Gene...\n")

gene_search <- entrez_search(
  db = "gene",
  term = "CASQ1[Gene Name] AND Homo sapiens[Organism]",
  retmax = 10,
  config = httr::timeout(120)
)

if (length(gene_search$ids) == 0) {
  stop("CASQ1 was not found. Check your internet connection and retry Step 2.")
}

gene_id <- gene_search$ids[1]

gene_record <- entrez_fetch(
  db = "gene",
  id = gene_id,
  rettype = "xml",
  retmode = "text",
  config = httr::timeout(120)
)

writeLines(
  c(
    "NCBI GENE SUMMARY",
    paste("Gene symbol:", gene_symbol),
    paste("NCBI Gene ID:", gene_id),
    paste("Organism: Homo sapiens"),
    paste("NCBI Gene URL:",
          paste0("https://www.ncbi.nlm.nih.gov/gene/", gene_id)),
    "",
    "Retrieved NCBI Gene record:",
    gene_record
  ),
  "results/gene_summary.txt"
)

cat("Gene summary saved successfully.\n")
cat("NCBI Gene ID:", gene_id, "\n")


# STEP 3. RETRIEVE THE ASSIGNED TRANSCRIPT AND PROTEIN
# Fetch the exact assigned NM_ transcript from NCBI.

cat("\nSTEP 3: Retrieving transcript and protein...\n")

genbank_record <- entrez_fetch(
  db = "nuccore",
  id = transcript_accession,
  rettype = "gb",
  retmode = "text",
  config = httr::timeout(120)
)

# Save the retrieved GenBank record for documentation
writeLines(
  genbank_record,
  "results/transcript_genbank_record.txt"
)

# Extract the matching NP_ protein accession
protein_matches <- regmatches(
  genbank_record,
  gregexpr(
    'protein_id="NP_[0-9]+\\.[0-9]+"',
    genbank_record
  )
)[[1]]

if (length(protein_matches) == 0) {
  stop(
    "No NP_ protein accession was found in the transcript record. ",
    "Check the transcript record before continuing."
  )
}

protein_accession <- sub(
  'protein_id="(NP_[0-9]+\\.[0-9]+)"',
  "\\1",
  protein_matches[1]
)

cat("Matched protein:", protein_accession, "\n")

# Fetch the matching protein FASTA sequence
protein_fasta <- entrez_fetch(
  db = "protein",
  id = protein_accession,
  rettype = "fasta",
  retmode = "text",
  config = httr::timeout(120)
)

writeLines(
  protein_fasta,
  "data/CASQ1_protein.fasta"
)

writeLines(
  c(
    paste("Gene:", gene_symbol),
    paste("Transcript:", transcript_accession),
    paste("Protein accession:", protein_accession),
    paste("NCBI Protein URL:",
          paste0(
            "https://www.ncbi.nlm.nih.gov/protein/",
            protein_accession
          ))
  ),
  "results/protein_accession.txt"
)

cat("Protein FASTA saved successfully.\n")


# STEP 4. CALCULATE PROTEIN LENGTH AND AMINO-ACID COMPOSITION

cat("\nSTEP 4: Calculating amino-acid composition...\n")

fasta_lines <- readLines("data/CASQ1_protein.fasta")

# Remove the FASTA header and combine the sequence lines
protein_sequence <- paste(
  fasta_lines[!grepl("^>", fasta_lines)],
  collapse = ""
)

protein_sequence <- toupper(
  gsub("[[:space:]]", "", protein_sequence)
)

if (nchar(protein_sequence) == 0) {
  stop("The downloaded protein sequence is empty.")
}

protein_length <- nchar(protein_sequence)

# Count the 20 standard amino acids
amino_acids <- c(
  "A", "R", "N", "D", "C", "Q", "E", "G", "H", "I",
  "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V"
)

aa_counts <- table(
  factor(
    strsplit(protein_sequence, "")[[1]],
    levels = amino_acids
  )
)

aa_data <- data.frame(
  Amino_Acid = names(aa_counts),
  Count = as.integer(aa_counts)
)

aa_data$Percentage <- round(
  aa_data$Count / protein_length * 100,
  2
)

write.csv(
  aa_data,
  "results/amino_acid_composition.csv",
  row.names = FALSE
)

writeLines(
  c(
    paste("Gene:", gene_symbol),
    paste("Transcript:", transcript_accession),
    paste("Protein accession:", protein_accession),
    paste("Protein length:", protein_length, "amino acids")
  ),
  "results/protein_length.txt"
)

# Identify the three most frequent standard amino acids
top_three <- aa_data[
  order(-aa_data$Count),
][1:3, ]

writeLines(
  capture.output(print(top_three, row.names = FALSE)),
  "results/top_three_amino_acids.txt"
)

# Create Figure 1: amino-acid composition bar chart
figure1 <- ggplot(
  aa_data,
  aes(x = reorder(Amino_Acid, -Count), y = Count)
) +
  geom_col() +
  labs(
    title = "CASQ1 Amino-Acid Composition",
    subtitle = paste(
      "Protein:", protein_accession,
      "| Length:", protein_length, "amino acids"
    ),
    x = "Amino Acid",
    y = "Number of Residues"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

ggsave(
  "figures/01_amino_acid_composition.png",
  plot = figure1,
  width = 9,
  height = 6,
  dpi = 300
)

cat("Protein length:", protein_length, "amino acids\n")
cat("Amino-acid CSV and Figure 1 saved.\n")
cat("Top three amino acids:\n")
print(top_three)


# STEP 5. RECORD THE ASSIGNED CLINVAR VARIANT
# Open the ClinVar page and manually verify its CURRENT contents.
# Do not assume the classification remains unchanged.

clinvar_url <- paste0(
  "https://www.ncbi.nlm.nih.gov/clinvar/variation/",
  clinvar_id,
  "/"
)

clinvar_notes <- c(
  "CLINVAR VARIANT NOTES",
  paste("Gene:", gene_symbol),
  paste("Transcript:", transcript_accession),
  paste("DNA change: c.731A>G"),
  paste("Protein change:", variant_protein),
  paste("Protein position:", variant_position),
  paste("ClinVar Variation ID:", clinvar_id),
  paste("ClinVar URL:", clinvar_url),
  paste("Date checked:", Sys.Date()),
  "",
  "Complete the following after manually checking ClinVar:",
  "Current variant name:",
  "Current aggregate classification:",
  "Review status / stars:",
  "Condition(s) listed:",
  "Variant type:",
  "HGVS expression shown:",
  "Last evaluated date:",
  "Publications / supporting evidence:",
  "Conflicting submissions or limitations:",
  "",
  "Scientific note:",
  "Distinguish experimental findings, clinical associations,",
  "and computational predictions. Do not treat predictions alone",
  "as proof of a damaging molecular effect."
)


clinvar_notes_file <- "results/clinvar_variant_notes.txt"

if (!file.exists(clinvar_notes_file)) {
  writeLines(clinvar_notes, clinvar_notes_file)
  cat("ClinVar notes template created.\n")
} else {
  cat("Existing ClinVar notes preserved; file was not overwritten.\n")
}

cat("Open and verify:", clinvar_url, "\n")


# STEP 6. CREATE FIGURE 2: VARIANT POSITION IN CASQ1
# This marks residue 244 on the protein sequence.
# It does NOT prove the variant's structural or functional effect.

if (variant_position > protein_length || variant_position < 1) {
  stop("Variant position is outside the retrieved protein sequence.")
}

variant_data <- data.frame(
  Position = variant_position,
  Label = variant_protein
)

figure2 <- ggplot() +
  geom_segment(
    aes(x = 1, xend = protein_length,
        y = 0, yend = 0),
    linewidth = 2
  ) +
  geom_point(
    data = variant_data,
    aes(x = Position, y = 0),
    size = 4
  ) +
  geom_text(
    data = variant_data,
    aes(x = Position, y = 0.15, label = Label),
    vjust = 0
  ) +
  scale_x_continuous(
    limits = c(1, protein_length),
    breaks = seq(50, protein_length, by = 50)
  ) +
  coord_cartesian(ylim = c(-0.1, 0.6)) +
  labs(
    title = "CASQ1 Protein and Assigned Variant",
    subtitle = paste(
      "Residue", variant_position,
      "of", protein_length, "amino acids"
    ),
    x = "Amino-Acid Position",
    y = NULL
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

ggsave(
  "figures/02_variant_position.png",
  plot = figure2,
  width = 10,
  height = 4,
  dpi = 300
)

cat("Figure 2 saved successfully.\n")


# STEP 7. SAVE A REPRODUCIBILITY / SOURCE RECORD

source_notes <- c(
  "DATA SOURCES AND REPRODUCIBILITY",
  paste("Analysis date:", Sys.Date()),
  paste("Gene:", gene_symbol),
  paste("NCBI Gene ID:", gene_id),
  paste("Transcript:", transcript_accession),
  paste("Protein accession:", protein_accession),
  paste("ClinVar Variation ID:", clinvar_id),
  paste("Variant:", variant_protein),
  "",
  "NCBI Gene:",
  paste0("https://www.ncbi.nlm.nih.gov/gene/", gene_id),
  "",
  "NCBI Transcript:",
  paste0(
    "https://www.ncbi.nlm.nih.gov/nuccore/",
    transcript_accession
  ),
  "",
  "NCBI Protein:",
  paste0(
    "https://www.ncbi.nlm.nih.gov/protein/",
    protein_accession
  ),
  "",
  "ClinVar:",
  clinvar_url,
  "",
  "Packages used: rentrez, ggplot2, httr",
  "Access dates and current ClinVar interpretation should be",
  "verified and documented in the README."
)

writeLines(
  source_notes,
  "results/source_and_accession_notes.txt"
)

cat("\nALL AUTOMATED STEPS COMPLETED.\n")
cat("Check the data, results, and figures folders.\n")
cat("Remember to complete the ClinVar notes manually.\n")
