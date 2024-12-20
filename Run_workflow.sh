#!/bin/bash

# Submit the first layer array job
array_1_job_id=$(sbatch matlab_array_1.sh | awk '{print $4}')
echo "Submitted layer 1 job: $array_job_id"

# Submit the aggregation job, depending on the first array
agg_1_job_id=$(sbatch --dependency=afterany:${array_1_job_id} matlab_agg_1.sh | awk '{print $4}')
echo "Submitted aggregation 1 job: $agg_1_job_id"
