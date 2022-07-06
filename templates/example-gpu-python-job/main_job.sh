#!/bin/bash 
#SBATCH -p gpu       ## Partition
#SBATCH -q wildfire  ## QOS
#SBATCH -c 1         ## Number of Cores
#SBATCH --time=5     ## 5 minutes of compute
#SBATCH --gres=gpu:1 ## 1 of first available GPU
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --export=NONE          ## keep environment clean
#SBATCH --mail-type=ALL        ## notify for any job state change
#SBATCH --mail-user=%u@asu.edu ## notify email (%u expands -> username)
#SBATCH --job-name="ood-gpu-python-example" ## optional job name

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Purging modules"
module purge
echo "Loading python 3 from anaconda module"
module load anaconda/py3
echo "Loading pytorch-gpu conda environment"
source activate pytorch-gpu
echo "Running example gpu python script"
python gpu-hello.py
