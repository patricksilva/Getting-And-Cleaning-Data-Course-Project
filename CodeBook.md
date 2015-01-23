# Code Book

## Raw Data Set

### General information
Raw data were obtained from UCI Machine Learning repository.
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.

The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data.

For more information see readme file in [zip-file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
containing initial data set.

### Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These signals were used to estimate variables of the feature vector for each pattern: 
* tBodyAcc-XYZ: time domain body acceleration in the X, Y and Z directions;
* tGravityAcc-XYZ: time domain gravity acceleration in the X, Y and Z directions;
* tBodyAccJerk-XYZ: time domain body acceleration jerk in the X, Y and Z directions;
* tBodyGyro-XYZ: time domain body anglular velocity in the X, Y and Z directions;
* tBodyGyroJerk-XYZ: time domain body angular acceleration in the X, Y and Z directions;
* tBodyAccMag: time domain body acceleration magnitude;
* tGravityAccMag: time domain gravity acceleration magnitude;
* tBodyAccJerkMag: time domain body acceleration magnitude;
* tBodyGyroMag: time domain body angular velocity magnitude;
* tBodyGyroJerkMag: time domain body angular acceleration magnitude;
* fBodyAcc-XYZ: frequency domain body acceleration in the X, Y and Z directions;
* fBodyAccJerk-XYZ: frequency domain body acceleration jerk in the X, Y and Z directions;
* fBodyGyro-XYZ: frequency domain body angular velocity in the X, Y and Z directions;
* fBodyAccMag: frequency domain body acceleration magnitude;
* fBodyAccJerkMag: frequency domain body acceleration jerk magnitude;
* fBodyGyroMag: frequency domain body angular velocity magnitude;
* fBodyGyroJerkMag: frequency domain body angular acceleration magnitude.

The set of variables that were estimated from these signals are: 
* mean(): mean value;
* std(): standard deviation;
* mad(): median absolute deviation;
* max(): largest value in array;
* min(): smallest value in array;
* sma(): signal magnitude area;
* energy(): energy measure. Sum of the squares divided by the number of values;
* iqr(): interquartile range;
* entropy(): signal entropy;
* arCoeff(): autorregresion coefficients with Burg order equal to 4;
* correlation(): correlation coefficient between two signals;
* maxInds(): index of the frequency component with largest magnitude;
* meanFreq(): weighted average of the frequency components to obtain a mean frequency;
* skewness(): skewness of the frequency domain signal;
* kurtosis(): kurtosis of the frequency domain signal;
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window;
* angle(): Angle between to vectors.

No unit of measures is reported as all features were normalized and bounded within [-1,1].

## Data Transformation

### Merge initial data
First for training and test data activity id numbers, subject id numbers and features data were merged. Second two obtained 
tables were combined.

### Extract the measurements on the mean and standard deviation for each measurement. 
From the merged data set only features with both of "mean()" and "std()" partial words were extracted. Features containing "meanFreq()" 
are intermediate values for transforming [time-domain](http://en.wikipedia.org/wiki/Time_domain) data into 
[frequency domain](http://en.wikipedia.org/wiki/Frequency_domain), so they were not included in the final data set.

### Use descriptive activity names
Activity names were transformed to [CamelCase](http://en.wikipedia.org/wiki/CamelCase) cause it's the best way to make both 
human-readable and descriptive names containing two or more words without using of underscores or hyphens. 
Activity id numbers were substituted by activity names.

### Label the data set with descriptive variable names
Feature names were transformed to CamelCase too with some changes:
* all parenthesis and hyphens were removed;
* "t" and "f" prefixes corresponding to time domain and frequency domain were substituted by "Time" and "Freq" respectively;
* cause gyroscope detects angular velocity and angular acceleration, "Gyro" and "GyroJerk" were substituted by "AngularVelocity" 
and "AngularAcceleration" respectively;
* in the same way accelerator detects acceleration and acceleration [jerk](http://en.wikipedia.org/wiki/Jerk_%28physics%29), 
so "Acc" and "AccJerk" were replaced by "Acceleration" and "AccelerationJerk" respectively.

### Create final tidy data set
Final data set were created from the intermediate data set by averaging extracted features for each activity and each subject.

## Tidy Data Set

Final data set is a table with 180 rows (one for every combination of six activities and thirty subjects) and 68 columns (2 
for activity name and subject id number and 66 for extracted variables) and contains the average values of each variable
for each activity and each subject.

Final variables are ("XYZ" is used to denote 3-axial signals in the X, Y and Z directions):
* TimeBodyAccelerationMeanXYZ
* TimeBodyAccelerationStdXYZ
* TimeGravityAccelerationMeanXYZ
* TimeGravityAccelerationStdXYZ
* TimeBodyAccelerationJerkMeanXYZ
* TimeBodyAccelerationJerkStdXYZ
* TimeBodyAngularVelocityMeanXYZ
* TimeBodyAngularVelocityStdXYZ
* TimeBodyAngularAccelerationMeanXYZ
* TimeBodyAngularAccelerationStdXYZ
* TimeBodyAccelerationMagMean
* TimeBodyAccelerationMagStd
* TimeGravityAccelerationMagMean
* TimeGravityAccelerationMagStd
* TimeBodyAccelerationJerkMagMean
* TimeBodyAccelerationJerkMagStd
* TimeBodyAngularVelocityMagMean
* TimeBodyAngularVelocityMagStd
* TimeBodyAngularAccelerationMagMean
* TimeBodyAngularAccelerationMagStd
* FreqBodyAccelerationMeanXYZ
* FreqBodyAccelerationStdXYZ
* FreqBodyAccelerationJerkMeanXYZ
* FreqBodyAccelerationJerkStdXYZ
* FreqBodyAngularVelocityMeanXYZ
* FreqBodyAngularVelocityStdXYZ
* FreqBodyAccelerationMagMean
* FreqBodyAccelerationMagStd
* FreqBodyAccelerationJerkMagMean
* FreqBodyAccelerationJerkMagStd
* FreqBodyAngularVelocityMagMean
* FreqBodyAngularVelocityMagStd
* FreqBodyAngularAccelerationMagMean
* FreqBodyAngularAccelerationMagStd
