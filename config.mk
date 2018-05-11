## Here we declare the variables that are going to be used by mkfile.

# Define the sequencing system. (accepted types are  GA1, GA2, HS10, HS20, HS25, HSXn, HSXt, MinS, MSv1, MSv3, NS50)
# GA1 - GenomeAnalyzer I (36bp,44bp), GA2 - GenomeAnalyzer II (50bp, 75bp), HS10 - HiSeq 1000 (100bp), HS20 - HiSeq 2000 (100bp),
# HS25 - HiSeq 2500 (125bp, 150bp), HSXn - HiSeqX PCR free (150bp), HSXt - HiSeqX TruSeq (150bp),MinS - MiniSeq TruSeq (50bp),
# MSv1 - MiSeq v1 (250bp), MSv3 - MiSeq v3 (250bp), NS50 - NextSeq500 v2 (75bp)
## Comment or uncomment lines to change the type of event being generated

#SEQ_SYSTEM="GA1"
#SEQ_SYSTEM="GA2"
#SEQ_SYSTEM="HS10"
#SEQ_SYSTEM="HS20"
SEQ_SYSTEM="HS25"
#SEQ_SYSTEM="HSXn"
#SEQ_SYSTEM="MinS"
#SEQ_SYSTEM="MSv1"
#SEQ_SYSTEM="MSv3"
#SEQ_SYSTEM="NS50"

# Define the read length. (depends on the sequencing system)
READ_LENGTH="150"

# Define the read coverage.
COV="30"

# Define the mean size of the DNA fragment for paired-end simulation.
SIZE="200"

# Define the standard deviation of SNA fragment size for paired-end simulation.
STD="10"
