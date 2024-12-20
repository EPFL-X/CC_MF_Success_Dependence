#!/bin/bash

#SBATCH --nodes 1 
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --time 1:00:00
#SBATCH --qos=serial
#SBATCH --mem=480G

#SBATCH --mail-user=ZHE.ZHANG@epfl.ch
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --error=matlab_%A.err
#SBATCH --output=matlab_%A.out
set -e

ulimit -n 131072
echo STARTING AT `date`
echo "Slurm Job Id SLURM_ARRAY_JOB_ID is ${SLURM_ARRAY_JOB_ID}"

module purge
module load matlab/R2024a
module list

matlab -nosplash -nodisplay -nodesktop -r "Array_data_process; exit"
 

echo FINISHED at `date`
