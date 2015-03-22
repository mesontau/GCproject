rm(list = ls())
####################################################
# Write here the path to the data folder           #
#                                                  #
datafolder <- "/Users/napedro/Dropbox/Coursera/DataScienceSpecialization/03.GettingAndCleaningData/project/UCI_HAR_Dataset"              #
# If datafolder is left in blank,                  #    
# this script should be placed at the data folder. #
####################################################


loadLibrary <- function(lib) { 
    if(!require(lib, character.only = T)) { 
        install.packages(lib)
        library(lib, character.only = T)
    } 
}

# load necessary libraries###
loadLibrary("dplyr")        #
#############################

if(datafolder == "") datafolder <- getwd()

outputfile <- file.path(datafolder, "summary_by_subject_and_activity.txt")

# initial variables determining which experiments and observations should be imported ######
datasets <- c("train", "test")
inertial_signals <- c("body_acc", "body_gyro", "total_acc")
inertial_signals_synonyms <- list( body_acc = "inertialsig_BodyAcc", 
                                   body_gyro = "inertialsig_BodyGyro", 
                                   total_acc = "inertialsig_TotalAcc") 
axes <- c("x", "y", "z")
############################################################################################



importDataset <- function(dselement){
    # returns a tidy data frame containing all relevant variables (mean and standard deviation)
    # of one data set (i.e.: train or test).
    
    readInertia <- function(inertialsignal, nrows){
        # This function reads three files (the axis x,y,z) for each inertial signal.
        # Each row read from each file contains a 128 vector, which the function summarizes 
        # in mean and standard deviation.
        #
        # The function returns: 
        #   a dataframe with: 
        #       inertialsignal_axis_mean, inertialsignal_axis_sd, ... 
        
        # initialize an empty data frame with a dummy column and
        # the right number of rows (passed as parameter to the function)
        inertial <- data.frame(matrix(nrow = nrows, ncol = 1))
        names(inertial) <- c("dummy")
        
        for(axis in axes){
            inertfile <- file.path(datafolder, dselement, "Inertial Signals", 
                                   paste0( inertialsignal, "_", axis, "_", dselement, ".txt")) 
            inert <- read.table(inertfile, header = F)
            
            #Calculate mean and standard deviation for each observation
            inert$var_mean <- rowMeans(inert,na.rm = T)
            inert$var_sd <- apply(inert,1,sd)
            
            inert <- select(inert, var_sd:var_mean)  
            names(inert) <- c(paste0(inertial_signals_synonyms[[inertialsignal]] , "_mean_", toupper(axis)), 
                                 paste0(inertial_signals_synonyms[[inertialsignal]], "_sd_", toupper(axis)))
            
            # Add current variable to the data frame "inertial"
            inertial <- cbind(inertial, inert)
        }
        
        inertial <- select(inertial, -c(dummy))  # We get rid of the "dummy" column.
        inertial
    }

    # Paths to the different files containing data.
    activitiesfile <- file.path(datafolder, "activity_labels.txt")
    featuresfile <- file.path(datafolder, "features.txt")
    subjectfile <- file.path(datafolder, dselement, paste0("subject_", dselement,".txt"))
    xfile <- file.path(datafolder, dselement, paste0("X_", dselement,".txt"))
    yfile <- file.path(datafolder, dselement, paste0("y_", dselement,".txt"))
    
    # Categorization of activities.
    activities <- read.table(activitiesfile, header=F)
    names(activities) <- c("activity_idx", "activity")
    
    # Variable names for 'X' type files.
    features <- read.table(featuresfile, stringsAsFactors = F )[,2]
    
    # Subjects' identification.
    subject <- read.table(subjectfile, header = F, sep = ",", colClasses = c("numeric"))
    names(subject) <- c("subject.nr")

    # Activity reported for each observation.
    y <- read.table(yfile, header = F, sep = ",", colClasses = c("numeric"))
    names(y) <- c("activity_idx")
    y <- merge(y, activities, by = "activity_idx")
    
    # bind observations' subject identifications with activities.  
    subject <- cbind(subject, y)
    subject <- select(subject, -activity_idx) # we leave only the categorical value for activities.
       
    # bind data set name (i.e. test or training) to the tidy table 
    # (which already contains subject ids and activities)
    dataset_label <- rep(dselement, nrow(subject))
    names(dataset_label) <- c("dataset_label")
    subject <- cbind(dataset_label, subject)
    
    # bind features data (just mean and standard deviation for each feature) to the tidy table.
    x <- read.table(xfile, header = F, strip.white = F, fill=T)
    names(x) <- features
    x <- x[, grepl("mean\\(|std\\(", colnames(x))]
    names(x) <-  gsub("\\(\\)","", names(x)) # Remove ugly parenthesis in mean() and sd()
    
    # bind all inertial signals to the tidy table. 
    for(ins in inertial_signals){
        x <- cbind(x, readInertia(ins, nrow(subject)))
    }
    tidy_ds <- cbind(subject, x)
 
    # Returns the tidy dataset 1 (for one of the data sets: train or test)
    tidy_ds
}

# Merge tidy data sets of each data set (train and test).
tidy_dataset1 <- do.call(rbind, lapply(datasets, importDataset)) 

# Build tiny data set 2: 
# an independent tidy data set with the average of each variable for each activity and each subject.
## need to keep an index of each subject with its data set label 
## (which subject belongs to each data set).
subjects_labels <- unique(tidy_dataset1[, c(1,2)], row.names=NULL)    

## generate the tidy data set 2...
tidy_dataset2 <- tidy_dataset1 %>% group_by(subject.nr, activity) %>% summarise_each(funs(mean), -dataset_label)
## ... and link data sets to each subject back.
tidy_dataset2 <- merge(subjects_labels, tidy_dataset2, by="subject.nr")

# Write the final tidy data set 2.
write.table(tidy_dataset2, outputfile, row.name = FALSE)
