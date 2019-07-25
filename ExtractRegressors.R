ExtractRegressors <- function(PathToFile) {
Data = read.table(file = PathToFile, sep = '\t', header = TRUE)
Data2 = Data2 = Data[c("rot_x","rot_y","rot_z","trans_x","trans_y","trans_z","framewise_displacement")]

}