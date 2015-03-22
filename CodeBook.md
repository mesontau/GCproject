## Summary of "Human Activity Recognition Using Smartphones Dataset"
+ Data extracted and filtered from Jorge L. Reyes-Ortiz, et al. 

### Experimental data (as from Reyes-Ortiz, et al.):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

---

### Variable dictionary

1. **subject.nr**

    numeric: person (subject) number.
    
    range: 1..30
    
2. **dataset_label**

    string (categorical): data set to which the subject belongs to (train or test).
    
        Categories:
        * train (7352 cases)
        * test  (2947 cases)

3. **activity**

    string (categorical): activity the subject was doing during the measurement.
        
        Categories:
        * WALKING
        * WALKING_UPSTAIRS 
        * WALKING_DOWNSTAIRS 
        * SITTING
        * STANDING
        * LAYING
        
4. **tBodyAcc-mean-X, tBodyAcc-mean-Y, tBodyAcc-mean-Z, tBodyAcc-std-X, tBodyAcc-std-Y, tBodyAcc-std-Z**
  
    numeric: 3-axial average and standard deviation at time domain of body accelerometer measurement.
    
    range: [-1,..., 1] (normalized values)

5. **tGravityAcc-mean-X, tGravityAcc-mean-Y, tGravityAcc-mean-Z, tGravityAcc-std-X, tGravityAcc-std-Y, tGravityAcc-std-Z**

    numeric: 3-axial average and standard deviation at time domain gravity accelerometer measurement.
    
    range: [-1,..., 1] (normalized values)

6. **tBodyAccJerk-mean-X, tBodyAccJerk-mean-Y, tBodyAccJerk-mean-Z, tBodyAccJerk-std-X, tBodyAccJerk-std-Y, tBodyAccJerk-std-Z**

    numeric: 3-axial average and standard deviation of the body linear acceleration (derived in time -- Jerk signal) at the time domain.
    
    range: [-1,..., 1] (normalized values)

7. **tBodyGyro-mean-X, tBodyGyro-mean-Y, tBodyGyro-mean-Z, tBodyGyro-std-X, tBodyGyro-std-Y, tBodyGyro-std-Z**

    numeric: 3-axial average and standard deviation of the body angular velocity at the time domain.
    
    range: [-1,..., 1] (normalized values)

8. **tBodyGyroJerk-mean-X, tBodyGyroJerk-mean-Y, tBodyGyroJerk-mean-Z, tBodyGyroJerk-std-X, tBodyGyroJerk-std-Y, tBodyGyroJerk-std-Z**

    numeric: 3-axial average and standard deviation of the body angular velocity (derived in time -- Jerk signal) at the time domain.

    range: [-1,..., 1] (normalized values)

9. **tBodyAccMag-mean, tBodyAccMag-std**

    numeric: average and standard deviation of the magnitude (using euclidean norm) of the body linear acceleration at the time domain.
    
    range: [-1,..., 1] (normalized values)

10. **tGravityAccMag-mean, tGravityAccMag-std**

    numeric: average and standard deviation of the magnitude (using euclidean norm) at time domain gravity accelerometer measurement.
    
    range: [-1,..., 1] (normalized values)

11. **tBodyAccJerkMag-mean, tBodyAccJerkMag-std**

    numeric: average and standard deviation of the magnitude (using euclidean norm) of the body linear acceleration (derived in time -- Jerk signal) at the time domain.
    
    range: [-1,..., 1] (normalized values)

12. **tBodyGyroMag-mean, tBodyGyroMag-std**

    numeric: average and standard deviation of the magnitude (using euclidean norm) of the body angular velocity at the time domain.
    
    range: [-1,..., 1] (normalized values)

13. **tBodyGyroJerkMag-mean, tBodyGyroJerkMag-std**

    numeric: average and standard deviation of the magnitude (using euclidean norm) of the body angular velocity (derived in time -- Jerk signal) at the time domain.

    range: [-1,..., 1] (normalized values)

14. **fBodyAcc-mean-X, fBodyAcc-mean-Y, fBodyAcc-mean-Z, fBodyAcc-std-X, fBodyAcc-std-Y, fBodyAcc-std-Z**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the body linear acceleration. 
    
    range: [-1,..., 1] (normalized values)

15. **fBodyAccJerk-mean-X, fBodyAccJerk-mean-Y, fBodyAccJerk-mean-Z, fBodyAccJerk-std-X, fBodyAccJerk-std-Y, fBodyAccJerk-std-Z**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the body linear acceleration (derived in time -- Jerk signal). 
    
    range: [-1,..., 1] (normalized values)

16. **fBodyGyro-mean-X, fBodyGyro-mean-Y, fBodyGyro-mean-Z, fBodyGyro-std-X, fBodyGyro-std-Y, fBodyGyro-std-Z**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the body angular velocity.
    
    range: [-1,..., 1] (normalized values)

17. **fBodyAccMag-mean, fBodyAccMag-std**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the body linear acceleration.
    
    range: [-1,..., 1] (normalized values)

18. **fBodyBodyAccJerkMag-mean, fBodyBodyAccJerkMag-std**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the body linear acceleration (derived in time -- Jerk signal).
    
    range: [-1,..., 1] (normalized values)

19. **fBodyBodyGyroMag-mean, fBodyBodyGyroMag-std**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the magnitude of the body angular velocity.
    
    range: [-1,..., 1] (normalized values)

20. **fBodyBodyGyroJerkMag-mean, fBodyBodyGyroJerkMag-std**

    numeric: average and standard deviation of Fast Fourier Transform (FFT) of the magnitude of the body angular velocity (derived in time -- Jerk signal).

    range: [-1,..., 1] (normalized values)

21. **inertialsig_BodyAcc_mean_X, inertialsig_BodyAcc_sd_X, inertialsig_BodyAcc_mean_Y, inertialsig_BodyAcc_sd_Y, inertialsig_BodyAcc_mean_Z, inertialsig_BodyAcc_sd_Z**

    numeric: 3-axial average and standard deviation of the body acceleration signal obtained by substracting the gravity from the total acceleration ('g' units). Original data showed a 128 element vector, which has been averaged here. 

22. **inertialsig_BodyGyro_mean_X, inertialsig_BodyGyro_sd_X, inertialsig_BodyGyro_mean_Y, inertialsig_BodyGyro_sd_Y, inertialsig_BodyGyro_mean_Z, inertialsig_BodyGyro_sd_Z**
    
    numeric: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Original data showed a 128 element vector (windows), which has been averaged here. 
    
23. **inertialsig_TotalAcc_mean_X, inertialsig_TotalAcc_sd_X, inertialsig_TotalAcc_mean_Y, inertialsig_TotalAcc_sd_Y, inertialsig_TotalAcc_mean_Z, inertialsig_TotalAcc_sd_Z**

    numeric: 3-axial average and standard deviation of the acceleration signal from the smartphone accelerometer in standard gravity units 'g'. Original data showed a 128 element vector, which
    has been averaged here. 
