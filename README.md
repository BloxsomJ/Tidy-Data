The dataset contains the following files and folders:
- 'README.md'
- 'Samsung_Data_Means.txt': averaged means and standard deviations for each subject performing each activity.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'original documentation' folder: contains README.txt and features_info.txt written by the compilers of the original data, from which much of the documentation for this version was derived.
- 'test' folder: contains test data
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample in the training set. Its range is from 1 to 30.
- 'test/X_test.txt': Training data set.
- 'test/y_test.txt': Training activity labels.
- 'train' folder: contains training data
- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample in the test set. Its range is from 1 to 30.
- 'train/X_test.txt': Test data set.
- 'train/y_test.txt': Test activity labels.
- 'train/Inertial Signals' and 'test/Inertial Signals' are raw data not used in this derived data set. Their descriptions can be found in the original documentation.
- 'run_analysis.R': R script that produces 'Samsung_Data_Means.txt' from the other data files.

The run_analysis.R script performs the following operations:
First, the script reads the instrument, subject and activity data for the test and training sets, then the index tables for feature names and activities. The test and training data are combined.

The instrument data is labelled from the index file, and then the measurements on the mean and standard deviation are extracted for each measurement by including only those variables with 'mean()' or 'std()' in their name. The derived values 'meanFreq()' were not included as this was deemed to be a more complex derived value rather than a straightforward mean.

The activity and subject labels are combined with the instrument data to produce a data set labelled by the experimental subject and the activity they were performing. The numerical feature labels were then replaced with descriptive names from the index table.

Then, the summarise_all function from the 'dplyr' package is used to calculate the mean of each experimental variable, for each subject-activity pair. In the final data frame 'data2', each column is a feature, and each row is the mean average of the data on that feature for a particular individual performing a particular activity.
