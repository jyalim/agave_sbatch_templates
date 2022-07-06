#!/bin/bash 
#SBATCH -p serial  ## Partition
#SBATCH -q normal  ## QOS
#SBATCH -c 1       ## Number of Cores
#SBATCH --time=5   ## 5 minutes of compute
#SBATCH --job-name=ood-example-R
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
echo "Loading R"
module load r/4.0.2-BLAS
echo "Running example R script"
R --no-save --quiet <  hello.r
