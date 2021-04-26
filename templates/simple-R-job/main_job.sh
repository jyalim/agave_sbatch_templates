#!/bin/bash 
#SBATCH -p serial  ## Partition
#SBATCH -q normal  ## QOS
#SBATCH -N 1       ## Number of Nodes
#SBATCH -c 1       ## Number of Cores
#SBATCH --time=5   ## 5 minutes of compute
#SBATCH --job-name=ood-template-simple-R
#SBATCH --error=slurm.%j.err
#SBATCH --output=slurm.%j.out
#SBATCH --export=NONE         ## keep environment clean

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Purging modules"
module purge
echo "Loading R"
module load r/4.0.2
echo "Running example R script"
R --no-save --quiet <  hello.r
