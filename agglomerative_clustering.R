#Implement agglomerative hierarchical clustering on geograhpical data
#using measures such as single link, complete link, and average link
#distance similarity measure uses Euclidean distance
con = file("test.txt", "r")
first_line = readLines(con, n=1)
close(con)
first_line
first_line = as.list(strsplit(first_line, " ")[[1]])
first_line
first_line=strtoi(first_line, base = 0L)
num_data = first_line[[1]]
num_cluster = first_line[[2]]
measure = first_line[[3]]
all_content =  readLines("test.txt")
skip_first = all_content[-1]
dat= read.table(textConnection(skip_first))
dat


similarity_dist = dist(dat)
similarity_dist
if(measure == 0){
  fitH = hclust(similarity_dist, method = "single")
  clusters = cutree(fitH,num_cluster)
}else if(measure==1){
  fitH = hclust(similarity_dist, method = "complete")
  clusters = cutree(fitH,num_cluster)
}else if(measure==2){
  fitH = hclust(similarity_dist, method = "average")
  clusters = cutree(fitH,num_cluster)
}else{
  print("Enter 0 for single link, 1 for complete link, or 2 for average link")
}
plot(fitH)

cat(clusters, sep = "\n")
