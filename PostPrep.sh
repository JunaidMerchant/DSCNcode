
#!/bin/bash
#
################################################################################
# This script does everything that needs to be done after fmriprep
# to get it ready to model in AFNI:
#
# 1) converts the preprocessed, MNI_2009 normalized and AROMA BOLD data to AFNI
#    brik/head format.
# 2) scales the preprocessed BOLD images so that they activations can be
#    interpreted as percent signal change.
# 3) extracts the 3 rotation, 3 translation, 1mm censor data, and framewise-
#    displacement values for each volume to be used as nuissance regressors.
# 4) Multiplies the preprocessed, scaled data by the brain mask to remove out of
#    brain data.
#
# Note: We are specifically using data normalized to MNI_2009 template, and
# that our censor criteria is 1 mm FD
#
# To use this script, you must modify the PARAMETERS section to match your study
# and can run as is. There are one of three ways to define which subjects you
# want to run this script on: 1) define the subjects in the parameters section;
# 2) give the subject id as input to the script, e.g. ./PostPrep.sh sub-JAM012 ;
# 3) or you can leave the subject parameter blank and not feed an id as input,
#   in which case it will perform these operations to all the subjects in the
#   fMRIprep folder! #Flexibility
#
##### PARAMETERS - CHANGE THESE TO MEET THE NEEDS OF YOUR STUDY ################
#
# First define fMRIprep superlevel directory ###################################
PrepDir="/export/data/neuron/JAM/fMRIprep/fmriprep"
#
# Second define the bold files that you want to perform these operations on ####
FuncName=("jam_run-01" "jam_run-02" "jam_run-03" "jam_run-04" "jam_run-05" \
"jam_run-06" "tom_run-01" "tom_run-02")
#
# Third define path to accompanying regressor extracting R script. This was too
# hard to do in bash, so I created R script to handle this part. Sloppy I know!
ExtractR="/export/data/neuron/JAM/ExtractRegressors.R"
#
# Finally define the subject IDs for which you want to run this script on. See 
# above about the three ways you can define subjects. Easisest would be to 
# define the subjects below. If you leave the below blank, then you can feed 
# a subject ID in as an input. If you don't do that, then this will run on all
# the subjects in the PrepDir defined above!
SubID=("sub-JAM012" "sub-JAM014" "sub-JAM016")
#
##### END OF PARAMETERS SECTION - DON'T MESS WITH THE STUFF BELOW #############
#
#
#
#
ErrorMessage="This script does everything that needs to be done after fmriprep \
to get it ready to model in AFNI, but needs the following:"
#
# Check to see if PrepDir has been assigned
if [ -z $PrepDir ] || [ -z $FuncName ] || [ -z $ExtractR ] ; then
	echo $ErrorMessage
	#
	if [ -z $PrepDir ] ; then
		echo "Need to define path to fmriprep directory"
	fi
	#
	if [ -z $FuncName ] ; then
		echo "Need to define bold files"
	fi
	#
	if [ -z $ExtractR ] ; then
		echo "Need to define bold files"
	fi
	#
fi
#
#
# Now, need to check what subjects to run!
if [ $# -eq 1 ]; then 
	SubID=$1
	echo Running PostPrep on $SubID
else
	if [ -z $SubID ] && [ $# -ne 1 ]; then
	SubID=$(find ${PrepDir} -type d -name sub*)
	if 

3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-01_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_1
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-02_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_2
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-03_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_3
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-04_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_4
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-05_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_5
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-06_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz AFNI/${s}/fmriprep/${s}_mni_preproc_run_6

3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-01_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_1
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-02_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_2
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-03_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_3
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-04_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_4
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-05_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_5
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-06_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz AFNI/${s}/fmriprep/${s}_brainmask_run_6

3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-01_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_1
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-02_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_2
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-03_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_3
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-04_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_4
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-05_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_5
3dcopy fMRIprep/fmriprep/sub-${s}/func/sub-${s}_task-jam_run-06_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz AFNI/${s}/fmriprep/${s}_aroma_run_6
