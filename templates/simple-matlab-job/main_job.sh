#!/bin/bash 
#SBATCH -p serial   ## Partition
#SBATCH -q normal   ## QOS
#SBATCH -N 1        ## Number of Nodes
#SBATCH -c 1        ## Number of Cores
#SBATCH --time=5    ## 5 minutes of compute
#SBATCH --job-name=simple-matlab-job
#SBATCH --error=slurm.%j.err
#SBATCH --output=slurm.%j.out

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Purging modules"
module purge
echo "Loading MATLAB 2020a"
module load matlab/2020a
echo "Running example MATLAB script"
matlab -nosplash -nodesktop < hello.m
