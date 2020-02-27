#run_analysis.R
library("dplyr")
if(!dir.exists("../UCI_HAR_Dataset")){print("Data directoty  missing")
}else{
    proj_dir <- getwd()
    
    
    setwd("../UCI_HAR_Dataset")
    features       <- read.delim("features.txt",        header=F, sep="")
    activity_lables<- read.delim("activity_labels.txt", header=F, sep="")
    
    setwd("test")
    
    test_dir <- list.files(getwd())
    print(test_dir)
    
    subject_test <- read.delim("subject_test.txt", header = F, sep = "")
    colnames(subject_test) <- c("Subject")
    
    x_test <- read.delim("X_test.txt", header = F, sep = "")
    colnames(x_test) <- features[,2]
    
    y_test <- read.delim("y_test.txt", header = F, sep = "")
    y_test <- left_join(y_test,activity_lables, by="V1")[,2]
    
    setwd("Inertial Signals")
    test_IS_dir <- list.files(getwd())
    body_acc_x_test  <- read.delim("body_acc_x_test.txt", header=F,sep="")
    body_acc_y_test  <- read.delim("body_acc_y_test.txt", header=F,sep="")
    body_acc_z_test  <- read.delim("body_acc_z_test.txt", header=F,sep="")
    body_gyro_x_test <- read.delim("body_gyro_x_test.txt",header=F,sep="")
    body_gyro_y_test <- read.delim("body_gyro_y_test.txt",header=F,sep="")
    body_gyro_z_test <- read.delim("body_gyro_z_test.txt",header=F,sep="")
    total_acc_x_test <- read.delim("total_acc_x_test.txt",header=F,sep="")
    total_acc_y_test <- read.delim("total_acc_y_test.txt",header=F,sep="")
    total_acc_z_test <- read.delim("total_acc_z_test.txt",header=F,sep="")    
    
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
    
    setwd(proj_dir)
    
    setwd("../UCI_HAR_Dataset/train")
    train_dir <- list.files(getwd())
    print(train_dir)
    subject_train <- read.delim("subject_train.txt", header = F, sep = "")
    colnames(subject_train) <- c("Subject")
    
    x_train <- read.delim("X_train.txt", header = F, sep = "")
    colnames(x_train) <- features[,2]
    
    y_train <- read.delim("y_train.txt", header = F, sep = "")
    y_train <- left_join(y_train,activity_lables, by="V1")[,2]
    
    setwd("Inertial Signals")
    train_IS_dir <- list.files(getwd())
    body_acc_x_train <- read.delim("body_acc_x_train.txt", header=F,sep="")
    body_acc_y_train <- read.delim("body_acc_y_train.txt", header=F,sep="")
    body_acc_z_train <- read.delim("body_acc_z_train.txt", header=F,sep="")
    body_gyro_x_train<- read.delim("body_gyro_x_train.txt",header=F,sep="")
    body_gyro_y_train<- read.delim("body_gyro_y_train.txt",header=F,sep="")
    body_gyro_z_train<- read.delim("body_gyro_z_train.txt",header=F,sep="")
    total_acc_x_train<- read.delim("total_acc_x_train.txt",header=F,sep="")
    total_acc_y_train<- read.delim("total_acc_y_train.txt",header=F,sep="")
    total_acc_z_train<- read.delim("total_acc_z_train.txt",header=F,sep="") 
    
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
    
    setwd(proj_dir)
    
    final_tbl <- rbind(test_df,train_df)
    
    colnames(final_tbl) <- colnames(final_tbl) %>% 
        gsub(pattern = "^X\\.",replacement = "") %>%
        gsub(pattern = "\\.\\.\\.",replacement = ".") %>%
        gsub(pattern = "\\.\\.",replacement = ".")
    
    #write.table(final_tbl,"final_tbl.txt",row.names=F)
    
    final_tbl_sel <- tbl_df(select(final_tbl,contains
                                   (c("subject","activity","Type","mean","std"))))
    
    final_tbl_average <- aggregate(final_tbl_sel[,4:89],
                                   list(subject =final_tbl_sel$Subject,
                                        activity=final_tbl_sel$activity,
                                        category=final_tbl_sel$Type),mean)
    
    write.table(final_tbl_average,"final_tbl_average.txt",
                row.names=F, col.names=T)
    
}

