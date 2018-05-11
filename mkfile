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
	&& for file in results/*
	do
	NEWNAME=`echo $file | sed "s#.build##"`
	mv -- "$file" "$NEWNAME"
	done

### Add a "clean" recipe to quickly remove results directory
clean:V:
	rm -r results/
