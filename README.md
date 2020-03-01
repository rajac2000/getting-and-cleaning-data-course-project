---
output:
  pdf_document: default
  html_document: default
---
# Project on Getting and Cleaning Data Course 
### by Rajasekar Chandrasekaran.
### 
This document contains all the details necessary to understand the data used and the R code written for the project on  Getting and Cleaning Data Course, of Johns Hopkins University in Coursera.

The actual data for this project was extracted from the below link provided in coursera.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Requirement: 

R script should be created called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


**Please refer to the comments in the run_analysis.R for more details on the Getting and Cleaning process.**

Final output created by the code is table "final_tbl_average".
Same has been witen out to a flat file names "final_tbl_average.txt"

Below are the field extracted in the final output.

 1. subject (Contains the Subect identification)
 2. activity (Contains oe of the six activities)
 3. category (C)
 4. tBodyAcc.mean.X
 5. tBodyAcc.mean.Y
 6. tBodyAcc.mean.Z
 7. tGravityAcc.mean.X
 8. tGravityAcc.mean.Y
 9. tGravityAcc.mean.Z
10. tBodyAccJerk.mean.X
11. tBodyAccJerk.mean.Y
12. tBodyAccJerk.mean.Z
13. tBodyGyro.mean.X
14. tBodyGyro.mean.Y
15. tBodyGyro.mean.Z
16. tBodyGyroJerk.mean.X
17. tBodyGyroJerk.mean.Y
18. tBodyGyroJerk.mean.Z
19. tBodyAccMag.mean.
20. tGravityAccMag.mean.
21. tBodyAccJerkMag.mean.
22. tBodyGyroMag.mean.
23. tBodyGyroJerkMag.mean.
24. fBodyAcc.mean.X
25. fBodyAcc.mean.Y
26. fBodyAcc.mean.Z
27. fBodyAcc.meanFreq.X
28. fBodyAcc.meanFreq.Y
29. fBodyAcc.meanFreq.Z
30. fBodyAccJerk.mean.X
31. fBodyAccJerk.mean.Y
32. fBodyAccJerk.mean.Z
33. fBodyAccJerk.meanFreq.X
34. fBodyAccJerk.meanFreq.Y
35. fBodyAccJerk.meanFreq.Z
36. fBodyGyro.mean.X
37. fBodyGyro.mean.Y
38. fBodyGyro.mean.Z
39. fBodyGyro.meanFreq.X
40. fBodyGyro.meanFreq.Y
41. fBodyGyro.meanFreq.Z
42. fBodyAccMag.mean.
43. fBodyAccMag.meanFreq.
44. fBodyBodyAccJerkMag.mean.
45. fBodyBodyAccJerkMag.meanFreq.
46. fBodyBodyGyroMag.mean.
47. fBodyBodyGyroMag.meanFreq.
48. fBodyBodyGyroJerkMag.mean.
49. fBodyBodyGyroJerkMag.meanFreq.
50. angle.tBodyAccMean.gravity.
51. angle.tBodyAccJerkMean.gravityMean.
52. angle.tBodyGyroMean.gravityMean.
53. angle.tBodyGyroJerkMean.gravityMean."
54. angle.X.gravityMean.
55. angle.Y.gravityMean.
56. angle.Z.gravityMean.
57. tBodyAcc.std.X
58. tBodyAcc.std.Y
59. tBodyAcc.std.Z
60. tGravityAcc.std.X
61. tGravityAcc.std.Y
62. tGravityAcc.std.Z
63. tBodyAccJerk.std.X
64. tBodyAccJerk.std.Y
65. tBodyAccJerk.std.Z
66. tBodyGyro.std.X
67. tBodyGyro.std.Y
68. tBodyGyro.std.Z
69. tBodyGyroJerk.std.X
70. tBodyGyroJerk.std.Y
71. tBodyGyroJerk.std.Z
72. tBodyAccMag.std.
73. tGravityAccMag.std.
74. tBodyAccJerkMag.std.
75. tBodyGyroMag.std.
76. tBodyGyroJerkMag.std.
77. fBodyAcc.std.X
78. fBodyAcc.std.Y
79. fBodyAcc.std.Z
80. fBodyAccJerk.std.X
81. fBodyAccJerk.std.Y
82. fBodyAccJerk.std.Z
83. fBodyGyro.std.X
84. fBodyGyro.std.Y
85. fBodyGyro.std.Z
86. fBodyAccMag.std.
87. fBodyBodyAccJerkMag.std.
88. fBodyBodyGyroMag.std.
89. fBodyBodyGyroJerkMag.std.

* Column 1 contains the Subect identification.  
* Column 2 contains one of the six activities.  
* Coulmn 3 contains  either of the two categories, TEST or TRAIN.  
Below are Average columns calcualted by grouping based on above three columns.  
* Columns  4 to 56 contains the average calculated for the measurements from the columns which are mean of the measurements.  
* Columns 57 to 89 contains the average calculated for the measurements from the columns which are standard deviations of the measurements.  


**Please refer to the comments in the run_analysis.R for more details on the Getting and Cleaning process.**


