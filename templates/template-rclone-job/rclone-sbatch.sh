#!/bin/bash
#SBATCH -p serial -q normal -t 3-0 -c 4 
#SBATCH -o slurm.rclone.%j.out
#SBATCH -J rclone-transfer
#SBATCH --mail-type=ALL
#SBATCH --mail-user=%u@asu.edu
#SBATCH --export=NONE

# ======================================================================
# Remotes with paths are passed as positional arguments (ex. below):
#   
#   sbatch rclone-sbatch.sh drive:data/ dropbox:team_dir/data/
#                           ^--1st arg  ^--2nd arg
#
# ======================================================================
 
in="$1"
to="$2"

now=$(date +%F_%s)

jobname="${SLURM_JOB_NAME// /_}"
jobid="${SLURM_JOB_ID}"
logdir="${HOME}/.local/var/rclone/transfers"
logrec="${logdir}/${now}--rclone-${jobname}-${jobid}.log"

! [[ -d "$logdir" ]] && mkdir -pv "$logdir" || :

module load rclone/1.58.1

N=$(nproc)

opts=(
  --transfers=$((N*2)) 
  --checkers=$((N*4))
  -P 
  -vv 
  --log-file="$logrec"
  --fast-list
  --use-mmap
  --drive-chunk-size=2G
  --dropbox-chunk-size=148M
  copy
  "$in"
  "$to"
)

rclone "${opts[@]}" 
