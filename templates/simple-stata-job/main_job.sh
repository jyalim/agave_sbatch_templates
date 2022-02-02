#!/bin/bash 
#SBATCH -N 1        ## Number of Nodes
#SBATCH -c 1        ## Number of Cores
#SBATCH --time=5    ## 5 minutes of compute 
#SBATCH --job-name=ood-stata17-job
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --mail-type=ALL        ## notify for any job state change
#SBATCH --mail-user=%u@asu.edu ## notify email (%u expands -> username)
#SBATCH --export=NONE          ## keep environment clean

## SCRIPT BEGINS
echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Loading STATA 17"
module load stata/17
stata-mp -b hello.do
