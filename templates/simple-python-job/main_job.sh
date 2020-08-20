#!/bin/bash 
#SBATCH -p serial  ## Partition
#SBATCH -q normal  ## QOS
#SBATCH -N 1       ## Number of Nodes
#SBATCH -c 1       ## Number of Cores
#SBATCH --time=5   ## 5 minutes of compute
#SBATCH --job-name=test
#SBATCH --error=slurm.%j.err
#SBATCH --output=slurm.%j.out

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Purging modules"
module purge
echo "Loading python 3 from anaconda module"
module load anaconda/py3
echo "Loading pyintel conda environment"
source activate pyintel
echo "Running example python script"
python hello.py
