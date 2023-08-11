#!/bin/bash
#SBATCH --job-name="nextflow_gem-map_test"
#SBATCH --partition=medium
#SBATCH --cpus-per-task=8
#SBATCH --mem=20G
#SBATCH --no-requeue
#SBATCH --mail-user=miquel.alvarez@estudiants.urv.cat
#SBATCH --mail-type=END,FAIL



nf-core modules create-test-yml gem3/gem3mapper
