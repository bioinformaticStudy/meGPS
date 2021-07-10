dat<-read.table(file="value.csv",sep=",",row.names=1,header=F)
dat_mat<-data.matrix(dat)

p_arr<-c()
for (i in 1:17966802){
	con<-matrix(c(dat_mat[i,1],dat_mat[i,3],dat_mat[i,2],dat_mat[i,4]),nrow = 2,dimnames =list(c("larger","smaller"),c("normal","HCC")))
	fish_t<-fisher.test(con,alternative='g')
	p_arr[i]<-fish_t$p

}

p_arr_adju<-p.adjust(p_arr,method="bonferroni")
pair_p_bonfe<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_bonfe,file="11_fisher/11_pair_p_bonfe.csv",sep=",",quote=F,row.names=F,col.names=F)

pair_p<-data.frame(row.names(dat),p_arr)
write.table(pair_p,file="11_fisher/11_pair_p.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="holm")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_holm.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="hochberg")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_hoch.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="hommel")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_hommel.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="BH")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_BH.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="BY")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_BY.csv",sep=",",quote=F,row.names=F,col.names=F)

p_arr_adju<-p.adjust(p_arr,method="fdr")
pair_p_adj<-data.frame(row.names(dat),p_arr_adju)
write.table(pair_p_adj,file="11_fisher/11_pair_p_fdr.csv",sep=",",quote=F,row.names=F,col.names=F)



