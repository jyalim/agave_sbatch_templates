#!/bin/bash
#SBATCH --job-name=ood-simple
#SBATCH --mem-per-cpu=100
#SBATCH --time=1
#SBATCH --mem-per-cpu=100M     
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --export=NONE          ## keep environment clean
#SBATCH --mail-type=ALL        ## notify for any job state change
#SBATCH --mail-user=%u@asu.edu ## notify email (%u expands -> username)

cd $SLURM_SUBMIT_DIR
echo "Hello World" > output_file

echo "Created output file with 'Hello World'"
