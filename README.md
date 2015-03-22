# Getting and Cleaning Data Project

The script run_analysis.R performs the following steps:

    1. Generates a big tidy data set:
    
        * for each data set (train and test) (via the function importDataset()):
            + reads the activity labels from file 'activity_labels.txt'.
            + reads the features (561 variables) from 'X_(train/test).txt'.
                - links feature variable names from file 'features.txt' 
            + reads subjects' identifications from 'subject_(train/test).txt'.
            + reads the activity reported for each observation from 'y_(train/test).txt'.
                + links activities (classified by numbers) with corresponding categorical values from 'activity_labels.txt'
            + binds in one table: subjects' identifications + activities (categorical values) + a data set label (train/test) + features
            + reads and binds to the previous table all inertial signals (body_acc/body_gyro/total_acc) via the internal function readInertia().
                - readInertia() reads for a given inertial signal all axes (x,y,z) files: inertiaSignal_(x/y/z)_(train/test).txt
                    - each observation is a 128-length vector: average and standard deviation is calculated for each observation.
    
    2. Generates a second tidy data set from the first one:
        
        * an independent tidy data set with the average of each variable for each activity and each subject.
            + keeps an index of each subject with its data set label (which subject belongs to each data set).
            
        * writes this second data set into the file: 'summary_by_subject_and_activity.txt'.
