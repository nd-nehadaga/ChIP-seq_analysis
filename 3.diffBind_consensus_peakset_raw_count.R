library(DiffBind)


### make consensus peakset and compute raw count data 
### Refer to "Diffbind biocondductor package to understand the input meta table file format"

metatable = read.table(file = "/path/to/inputmetable/with/all/info",header = T,sep = "\t")

####DBA object
data_dba =  dba(sampleSheet= as.data.frame(metatable))
############# Overlap Rate overall
olap.rate <- dba.overlap(data_dba,mode=DBA_OLAP_RATE)
plot(olap.rate,type='b',ylab='# peaks', xlab='Overlap at least this many peaksets')

#### Raw read counts
raw_reads_count = dba.count(DBA = data_dba ,minOverlap = 2,score = DBA_SCORE_READS)
raw_reads_count_df <- dba.peakset(raw_reads_count, bRetrieve=T, DataType=DBA_DATA_FRAME)

##### Output
output_file_name_path =  "/output_filename_with_path"

write.table(x = raw_reads_count_df,file = output_file_name_path,quote = F,sep = "\t",row.names = F,col.names = T)


