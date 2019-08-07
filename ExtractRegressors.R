ExtractRegressors <- function(PathToFile,OutputDir,CensorAmount) {
Data = read.table(file = PathToFile, sep = '\t', header = TRUE)

# extract 6 raw motion regressors
MoPar = Data[c("rot_x","rot_y","rot_z","trans_x","trans_y","trans_z")]
# write Mopar file
write.table(MoPar,paste(OutputDir,"/MoPar.1D", sep=""), quote = FALSE, sep = " ", row.names = FALSE, col.names = FALSE)

# create demeaned motion regressors
MoParDeMean=MoPar
for(x in 1:6){MoParDeMean[,x]=MoPar[,x]-mean(MoPar[,x])}
# write demean file
write.table(MoParDeMean,paste(OutputDir,"/MoParDeMean.1D", sep=""), quote = FALSE, sep = " ", row.names = FALSE, col.names = FALSE)

# extract derivative motion regressors
MoParDerv = Data[c("rot_x_derivative1","rot_y_derivative1","rot_z_derivative1","trans_x_derivative1","trans_y_derivative1","trans_z_derivative1")]
# write derivative file
write.table(MoParDerv,paste(OutputDir,"/MoParDerv.1D", sep=""), quote = FALSE, sep = " ", row.names = FALSE, col.names = FALSE)


# extract censor regressor
FD=Data[c("framewise_displacement")]
Censor=as.data.frame.array(FD)
# replace na in first row
if(Censor[1,1]=="n/a"){ 
  Censor[1,1]<-0
  }
# loop through to create censor regressor
for(x in 1:nrow(Censor)){
  if(Censor[x,1]>CensorAmount){
    Censor[x,1]=0
  } else {
    Censor[x,1]=1}
}
# write censor to 1D file
write.table(Censor,paste(OutputDir,"/Censor.1D", sep=""), quote = FALSE, sep = " ", row.names = FALSE, col.names = FALSE)


}
