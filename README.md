# Get Data Course Project

This repo contains files used in the context of the `Getting and Cleaning Data` course. The project consists in transforming a [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset into a tidy one providing the average of smartphone sensor measures for each activity and subject of the study.

## Transforming the Original Dataset
To transform the [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), simply do the following:
- Open RStudio
- Use `setwd()` to set the working directory to this repo's location on your local drive
- Run `source("run_analysis.R")`

## Output and Details
The resulting output is `out.txt` and is located in this repo's location on your local drive.

The full transformation process, along with details regarding the contents of `out.txt`, are detailed in `CookBook.md`.
