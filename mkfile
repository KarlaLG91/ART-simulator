MKSHELL=/bin/bash

# Load configurations from file 
< config.mk

# Simulate reads from a FASTA file with simulated SV, using ART.
#
results/%.paired_end:: data/%.fasta 
	set -x
	mkdir -p $(dirname $target)
	art_illumina -ss $SEQ_SYSTEM -sam -i $prereq \
	-l $READ_LENGTH -f $COV -m $SIZE -s $STD -o $target.build \
	&& mv $target.build $target
