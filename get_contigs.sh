#!/bin/bash

# Request one hour of wallclock time
#$ -l h_rt=8:0:0

# Request RAM
#$ -l rmem=8G

# Select threads
#$ -pe smp 1

# Set the working directory
#$ -wd /fastdata/bop20pp/del/

# Run the application.


echo "started"
date
source /usr/local/extras/Genomics/.bashrc

samtools idxstats $1 > out.txt

echo "finished"
date
