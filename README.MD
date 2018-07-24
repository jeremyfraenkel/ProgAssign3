README file

Note that it takes a few seconds for the file to load.

I started by downloading and unzipping the file.

Afterwards, I read all the relevant files and assigned them to different values. Not sure if there is a way to read all the files at once and assign them to different values?

I then merged the X files (numbers) and y files(activity) by binding the columns.

I continued by changing the y files numbers to the labels from activity_labels file and changed merge_y from a character vector to a data.frame to match the class of merge_X and merge_subject.

I then selected the relevant columns (the ones which have "merge()" or "std()"). I did not select the meanFreq columns since the Assignment asked for just mean or std. 

After doing that and using the features names as column names in merge_X (I renamed it by removing the "()" from the names and gave a longer description of each column in the CodeBook), I merged all the 3 data frames together in merge_all.

The CodeBook should be opened in RStudio using the following command:
View(read.table("CodeBook.md"))

Lastly, I used a long version for the tidy dataset. My tidy dataset has a table for each of the variable based on each subject and activity. The data meets all the criteria for a tidy dataset. 

