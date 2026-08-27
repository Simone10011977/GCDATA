# Code Book

## Source Data

The data used in this project come from the Human Activity Recognition Using Smartphones Dataset.

## Data Description

The dataset contains measurements collected from the accelerometer and gyroscope sensors of Samsung Galaxy smartphones worn by 30 subjects performing six different activities.

## Variables

### subject

Identifier of the volunteer (values from 1 to 30).

### activity

Descriptive activity name:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Measurement Variables

The dataset includes only variables containing:

- mean()
- std()

Examples:

- TimeBodyAccelerometer-mean()-X
- TimeBodyAccelerometer-std()-Y
- FrequencyBodyGyroscope-mean()-Z
- TimeGravityAccelerometerMagnitude-std()

Each measurement represents the average value for a given subject and activity.

## Transformations Performed

1. Training and test datasets were merged.
2. Subject and activity columns were added.
3. Only measurements containing mean() and std() were retained.
4. Activity IDs were replaced with descriptive activity names.
5. Variable names were made more descriptive:
   - t replaced with Time
   - f replaced with Frequency
   - Acc replaced with Accelerometer
   - Gyro replaced with Gyroscope
   - Mag replaced with Magnitude
   - BodyBody replaced with Body
6. A second tidy dataset was created by calculating the mean of each variable for each subject and activity.

## Tidy Dataset

The final dataset contains one row for each combination of subject and activity and one column for each averaged measurement variable.
