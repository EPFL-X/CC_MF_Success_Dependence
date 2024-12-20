#!/bin/bash

#SBATCH --array=1-7
#SBATCH --nodes 1 
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 72
#SBATCH --time 72:00:00
#SBATCH --qos=serial
#SBATCH --mem=480G

##SBATCH --partition=bigmem

#SBATCH --mail-user=ZHE.ZHANG@epfl.ch
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --error=matlab_%A_%a.err
#SBATCH --output=matlab_%A_%a.out
echo "Slurm Job Id SLURM_ARRAY_JOB_ID is ${SLURM_ARRAY_JOB_ID}"

set -e

ulimit -n 131072
echo STARTING AT `date`

module purge
module load matlab/R2024a
module list

# Create a local work directory
##mkdir -p /scratch/zhang2/Temp_$SLURM_JOB_ID
matlab -nosplash -nodisplay -nodesktop -r "Main($SLURM_ARRAY_TASK_ID); exit"
 
# Cleanup local work directory
##rm -rf /scratch/zhang2/Temp_$SLURM_JOB_ID



echo FINISHED at `date`