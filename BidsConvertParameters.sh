#!/bin/bash

# This is the bash parameters file to be used in conjunction with BidsConvert.sh
# Modify everything in quotes for each element (1-7) below for your study.

# 1) Subjects
# Define the subject IDs for the data you want to convert. These IDs should
# match the IDs of the dicom folders. You can include numerous subjects or just
# one. It is OK if the subject IDs have dashs, underscores, or special
# characters because the BidsConvert script will remove them from the name.
# export SubID=("JAM_020" "JAM_021" "JAM_023" "JAM_024" "JAM_026" "JAM_027" "JAM_029")

# 2) Dicom Directory
# Define the super directory where all the dicom folders reside.
export DcmDir="/data/bswift-1/jmerch/CAT/dicoms"

# 3) BIDS Study Directory
# Define the super directory where you want your BIDS organized data to reside.
export OutDir="/data/bswift-1/jmerch/CAT/in"

# 4) Path To dcm2niix
# Define path to the dcm2niix script. If dcm2niix is added to the bash/tcsh
# path/environment, you can simply use:
# Vert="dcm2niix"
export Vert="/data/bswift-1/jmerch/JAM/dcm2niix"

# 5) Functional Scans
# Define the names of the functional dicom folders to convert. 
export FuncDcms=("cmnt1" "cmnt2" "cmnt3" "cmnt4" "fix")

# Using the same order as above, define what you want them to be named
# REMEBER: Bids format does not like dashs, underscores, or any special
# characters for the name of the functional files. I incorporated this because
# the functional dicom folder names were not very descriptive.
export FuncName=("cmnt_run-01" "cmnt_run-02" "cmnt_run-03" "cmnt_run-04" "rest_run-01")

# 6) Structural Scans
# Define the names of the structural dicom folders to convert.
# Right now, this set up only allows for T1/MPRAGE structurals.
export StrctDcms=("t1_mpr")

# 7) Fieldmap Scans
# Define the names of the fieldmap dicom folders to convert.
# Right now, this only allows for opposite phase encoding direction fmaps.
export FmapDcms=("AP" "PA")


