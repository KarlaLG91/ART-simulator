MKSHELL=/bin/bash

# Load configurations from file 
< config.mk

# Simulate reads from a FASTA file with simulated SV, using ART.
#
results/%:: data/%.fasta 
	set -x
	mkdir -p $(dirname $target)
#
# For paired end
#
	if [[ $READ_TYPE == "paired_end" ]]; then
	art_illumina -ss $SEQ_SYSTEM -sam -i $prereq -p \
	-l $READ_LENGTH -f $COV -m $SIZE -s $STD -o $target"_$READ_TYPE".build
	fi  
#
# For single end reads
#
	if [[ $READ_TYPE == "single_end" ]]; then
	art_illumina -ss $SEQ_SYSTEM -sam -i $prereq \
	-l $READ_LENGTH -f $COV -o $target"_$READ_TYPE".build
	fi 
#
# For mate pair reads
#
	if [[ $READ_TYPE == "mate_pair" ]]; then
	art_illumina -ss $SEQ_SYSTEM -sam -i $prereq -mp \
	-l $READ_LENGTH -f $COV -m $SIZE -s $STD -o $target"_$READ_TYPE".build
	fi \
	&& mv $target"_$READ_TYPE".build1.aln $target"_$READ_TYPE"1.aln \
	mv $target"_$READ_TYPE".build1.fq $target"_$READ_TYPE"1.fq \
	mv $target"_$READ_TYPE".build2.aln $target"_$READ_TYPE"2.aln \
	mv $target"_$READ_TYPE".build2.fq $target"_$READ_TYPE"2.fq \
	mv $target"_$READ_TYPE".build.sam $target"_$READ_TYPE".sam

### Add a "clean" recipe to quickly remove results directory
clean:V:
	rm -r results/
