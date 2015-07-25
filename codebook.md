# Data Dictionary
## Tidied data set tidy_data.txt

This "code book" or data dictionary describes escribing variables and values in the tidy data set produced
as part of the course project for the Coursera/Johns Hopkins Data Science class "Getting and Cleaning Data."

The information originated from the data set "Human Activity Recognition Using Smartphones Dataset Version 1.0".
The documentation of that data set explains that the measurements were obtained from
a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

while wearing a smartphone (Samsung Galaxy S II) on the waist.
Which, using its using its embedded accelerometer and gyroscope, captured the following data:
* 3-axial linear acceleration
* 3-axial angular velocity

at a constant rate of 50 measurements/second.

The accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ were used to estimate variables
of the feature vector for each pattern:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Notes:

* -XYZ is used to denote 3-axial signals in the X, Y and Z directions.
* angle(): Indicates the angle between two vectors.
* mean() : mean values of multiple measurements of the original variables. Type: Real
* std():	Standard deviation of multiple measurements of the original variables. Type: Real
* activity_id: Identifier of the subject's activity. Type: Integer. Values: 1 through 6.
* subject_id :	Identifier of the subject. Type: Integer. Values: 1 through 30.
* activity_name: Descriptive name of each subject's activity. Type: Factor.


Values of activity_name:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Note the term "LAYING." The verb "lay" requires a direct object (i.e. it is transitive).
Therefore it follows, gramatically and logically, that these subjects were not lying down or lying around. Rather,
if the labels in this data set are interpreted literally in accordance with correct English grammar, the subjects
were were laying someone or something. Given their age it seems likely that they were "laying someone," that is to say, sexing.

See here for one grammar reference:
* http://www.quickanddirtytips.com/education/grammar/lay-versus-lie

Obviously in this day of the surveillance state and "ubiquitous" wearable, clutchable, "never mind," and/or on-body monitors,
using a technology in this way, to detect, report, and record when a person is having sex, would be very interesting,
and potentially valuable and powerful.

Apparently this data set does just that.


