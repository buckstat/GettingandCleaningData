README.md   file

Ted Buckless
Getting and cleaning Data Project


1. How the test and training sets are merged.  

The appropriate files are read in using the read.table command then combined. 

Variables used:

subject_test =  subject id's   from test  file
X_test       =  x axis data from x axis test  file
y_test       =  y axis data from x axis test  file
testCombined = combine the  column data from X_test, Y_test, and subjectId tables

subject_train =  subject id's   from train  file
X_train       =  x axis data from x axis train  file
y_train       =  y axis data from x axis train  file
trainCombined = combine the  column data from X_train, Y_train, and subjectId tables

Finally combine the test and train data:

allData = combine testCombined with trainCombined by row combine command
use the colNames command to load the variable names from the features table into the allData table

2. Extracts only the measurements on the mean() and std for each measurement.

fd =  use the select command  on the allData columns to remove all columns that don't include mean() or std also leave the activity and subjectId columns in the table


3. Uses the descriptive activity names to name the activities in the data set.

Replace activity labels [1-6] with approriate labels, SITTING, STANDING, etc
using fd[, 2] <- activityNames[fd[,2], 2]

4. Label the data sets with descriptive variable names.

clean up the included variables using the gsub command to make the variables more readable
remove (), - , capitilize M in Mean and S in std,  remove bodybody and replace with body, probable typo


5. Creates a tidy data set with the average of each variable for each activity and each subject.


meltdata     =   Finally,  use the melt command to group the data by subjectId and activty
computemean  =   then compute the mean of the grouped data 

Finally write out the tidy file called  TidyData.txt




