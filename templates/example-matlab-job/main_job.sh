#!/bin/bash 
#SBATCH -p serial   ## Partition
#SBATCH -q normal   ## QOS
#SBATCH -N 1        ## Number of Nodes
#SBATCH -c 1        ## Number of Cores
#SBATCH --time=5    ## 5 minutes of compute
#SBATCH --job-name=ood-example-matlab-job
#SBATCH --mem-per-cpu=100M     
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --export=NONE          ## keep environment clean
#SBATCH --mail-type=ALL        ## notify for any job state change
#SBATCH --mail-user=%u@asu.edu ## notify email (%u expands -> username)

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
