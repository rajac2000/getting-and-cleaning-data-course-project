# Project on Getting and Cleaning Data Course 
### by Rajasekar Chandrasekaran.

#run_analysis.R

# include the dplyr package.

library("dplyr")

# Get the current working directory and save it in proj_dir
# because we will use setwd() multiple times.
# to traverse through the directory structures in the zip file to be downloaded.

proj_dir <- getwd()

# Check if the directory "getdata_projectfiles_UCI HAR Dataset" exists one level up to the project Directory.
# If exists, The data extraction and cleaning process is already complete. Exit the code.
# else, download the file and process the data.


if(dir.exists("../getdata_projectfiles_UCI HAR Dataset")){
    print("Data directoty  Exists, Please delete directory '../getdata_projectfiles_UCI HAR Datase'")
    print("if you want to run the code again. This should be one level up from project directory.")
    
}else{
    
    # create the "getdata_projectfiles_UCI HAR Dataset" in the parent directoy of the actual project Directory.
    # This is because of the size of the Data file to be extracted and not to include this in the actual project directory.
    # To avoid getting the data uploaded to GIT.
    
    dir.create("../getdata_projectfiles_UCI HAR Dataset")
    
    #Set the new drectory as the current working directory.
    
    setwd("../getdata_projectfiles_UCI HAR Dataset")
    print("Data directoty  missing and was created")
    
    
    #Download the ZIP file. (Actual Data)
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  "getdata_projectfiles_UCI HAR Dataset.zip",mode="wb")
    print("ZIP file 'getdata_projectfiles_UCI HAR Dataset.zip' downloaded ")
    
    
    #Unzip the ZIP file in the same location.
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
    print("file unziped")
    
    #Set the new drectory as the current working directory.
    
    setwd("UCI HAR Dataset")
    
    #read the below to files in the "UCI HAR Dataset" into features and activity_lables
    
    features       <- read.delim("features.txt",        header=F, sep="")
    activity_lables<- read.delim("activity_labels.txt", header=F, sep="")
    
    # The file features.txt contains the 561 possible features that were measured.
    # The file activity_labels.txt contains the 6 possible activities that correspond to numbers 1 to 6.
    # This can be matched with acctivities in the other files.
    
    
    # The files "features_info.txt" and "README.txt" are only for information and need not be processed.
    
    
    #Change the current working directory to the "test" folder.
    
    setwd("test")
    
    test_dir <- list.files(getwd())
    print(test_dir)
    
    # Read the subject_test.txt for the list of subjects for the TEST category.

    subject_test <- read.delim("subject_test.txt", header = F, sep = "")
    
    # Manually assign column name "Subject" to the only column avaialble in the Subject_test table.
    colnames(subject_test) <- c("Subject")
    
    
    # Read the X_test.txt for Test data set.
    
    x_test <- read.delim("X_test.txt", header = F, sep = "")
    
    
    # Assign column names read from the features table to the  columnns avaialble of the table x_test.
    colnames(x_test) <- features[,2]
    
    
    # Read the y_test.txt for Test activities table.
    
    
    y_test <- read.delim("y_test.txt", header = F, sep = "")
    
    #Assign lables from the activity_lables table to the activities table y_test.
    
    y_test <- left_join(y_test,activity_lables, by="V1")[,2]
    
    #Change the current working directory to the "Inertial Signals" folder inside "test" folder.
    
    
    setwd("Inertial Signals")
    test_IS_dir <- list.files(getwd())
    
    #Read below 9 files inside the "Inertial Signals" of "test" folder and assign to table variables.
    
    body_acc_x_test  <- read.delim("body_acc_x_test.txt", header=F,sep="")
    body_acc_y_test  <- read.delim("body_acc_y_test.txt", header=F,sep="")
    body_acc_z_test  <- read.delim("body_acc_z_test.txt", header=F,sep="")
    body_gyro_x_test <- read.delim("body_gyro_x_test.txt",header=F,sep="")
    body_gyro_y_test <- read.delim("body_gyro_y_test.txt",header=F,sep="")
    body_gyro_z_test <- read.delim("body_gyro_z_test.txt",header=F,sep="")
    total_acc_x_test <- read.delim("total_acc_x_test.txt",header=F,sep="")
    total_acc_y_test <- read.delim("total_acc_y_test.txt",header=F,sep="")
    total_acc_z_test <- read.delim("total_acc_z_test.txt",header=F,sep="")    
    
    
    #Create a intermediate table with all the data collected for the TEST tables.
    
    test_df <- data.frame(subject  = subject_test,
                          activity = y_test, 
                          Type = rep("TEST",length(subject_test)),
                          "X" = x_test,
                          body_acc_x  = body_acc_x_test,  
                          body_acc_y  = body_acc_y_test,  
                          body_acc_z  = body_acc_z_test,
                          body_gyro_x = body_gyro_x_test, 
                          body_gyro_y = body_gyro_y_test, 
                          body_gyro_z = body_gyro_z_test,
                          total_acc_x = total_acc_x_test, 
                          total_acc_y = total_acc_y_test, 
                          total_acc_z = total_acc_z_test)
    
    #setwd(proj_dir)
    
    #Change the current working directory to the "train" folder.
    
    setwd("../../train")
    train_dir <- list.files(getwd())
    print(train_dir)
    
    
    subject_train <- read.delim("subject_train.txt", header = F, sep = "")
    
    # Manually assign column name "Subject" to the only column avaialble in the subject_train table.
    
    colnames(subject_train) <- c("Subject")
    
    # Read the subject_test.txt for the list of subjects for the TRAIN category.
    
    x_train <- read.delim("X_train.txt", header = F, sep = "")
    
    # Assign column names read from the features table to the  columnns avaialble of the table x_test.
    colnames(x_train) <- features[,2]
    
    # Read the y_train.txt for Train data set.
    
    y_train <- read.delim("y_train.txt", header = F, sep = "")
    
    #Assign lables from the activity_lables table to the activities table y_train.
    
    y_train <- left_join(y_train,activity_lables, by="V1")[,2]
    
    #Change the current working directory to the "Inertial Signals" folder inside "train" folder.
    
    setwd("Inertial Signals")
    train_IS_dir <- list.files(getwd())
    
    #Read below 9 files inside the "Inertial Signals" of "train" folder and assign to table variables.
    
    body_acc_x_train <- read.delim("body_acc_x_train.txt", header=F,sep="")
    body_acc_y_train <- read.delim("body_acc_y_train.txt", header=F,sep="")
    body_acc_z_train <- read.delim("body_acc_z_train.txt", header=F,sep="")
    body_gyro_x_train<- read.delim("body_gyro_x_train.txt",header=F,sep="")
    body_gyro_y_train<- read.delim("body_gyro_y_train.txt",header=F,sep="")
    body_gyro_z_train<- read.delim("body_gyro_z_train.txt",header=F,sep="")
    total_acc_x_train<- read.delim("total_acc_x_train.txt",header=F,sep="")
    total_acc_y_train<- read.delim("total_acc_y_train.txt",header=F,sep="")
    total_acc_z_train<- read.delim("total_acc_z_train.txt",header=F,sep="") 
    
    #Create a intermediate table with all the data collected for the TRAIN tables.
    
    train_df <- data.frame(subject  = subject_train,
                           activity = y_train, 
                           Type = rep("TRAIN",length(subject_train)),
                           "X" = x_train,
                           body_acc_x  = body_acc_x_train,  
                           body_acc_y  = body_acc_y_train,  
                           body_acc_z  = body_acc_z_train,
                           body_gyro_x = body_gyro_x_train, 
                           body_gyro_y = body_gyro_y_train, 
                           body_gyro_z = body_gyro_z_train,
                           total_acc_x = total_acc_x_train, 
                           total_acc_y = total_acc_y_train, 
                           total_acc_z = total_acc_z_train) 
    
    
    # change the current working directory to the actual project directoty.
    setwd(proj_dir)
    
    # Create a final table that combines both the TEST and TRAIN intermediate tables.
    
    final_tbl <- rbind(test_df,train_df)
    
    
    # Clean the columns names in the final table.
    
    colnames(final_tbl) <- colnames(final_tbl) %>% 
        gsub(pattern = "^X\\.",replacement = "") %>%
        gsub(pattern = "\\.\\.\\.",replacement = ".") %>%
        gsub(pattern = "\\.\\.",replacement = ".")
    
    #write.table(final_tbl,"final_tbl.txt",row.names=F)
    
    # select a subset of coulms that match names containing "subject","activity","Type","mean" or "std" and store into final_tbl_sel.
    
    final_tbl_sel <- tbl_df(select(final_tbl,contains
                                   (c("subject","activity","Type","mean","std"))))
    
    
    # Run the aggregate funcion with mean on the final_tbl_sel table grouped by "subject","activity" and "Type" and store into final_tbl_average.
    
    final_tbl_average <- aggregate(final_tbl_sel[,4:89],
                                   list(subject =final_tbl_sel$Subject,
                                        activity=final_tbl_sel$activity,
                                        category=final_tbl_sel$Type),mean)
    
    # Write the table final_tbl_average into a flat file named "final_tbl_average.txt" which will contain the final data.
    
    write.table(final_tbl_average,"final_tbl_average.txt",
                row.names=F, col.names=T)
    
    #remove everything from memory except final_tbl_average.
    #if you want to see the intermediate tables, comment the below 6 lines.
    
    memory_list <- ls()
    remove_list <- memory_list[memory_list != "final_tbl_average"]
    remove(list=remove_list)
    remove(memory_list)
    remove(remove_list)
    
    # end of execution.
}

