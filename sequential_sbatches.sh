#!/bin/bash

#! Wiktor Olszowy

set -o errexit

#-Folder where output and errors from running 'sbatch' will be saved.
mkdir out_err

#-AFNI
part=1; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60

#-FSL
part=2; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60
part=3; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60

#-SPM
part=4; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60
part=5; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60

#-transform results to MNI space and do cluster inference, all through FSL
part=6; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60
part=7; export part; sbatch --array=1-858 slurm_submit.array.hphi; sleep 60