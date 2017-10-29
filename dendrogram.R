library()
dev.off()
setwd("C:/Users/Ryo Uenoyama/Desktop")
library(readr)
data <- read.csv('snpscore_all_accesions2.csv', header=T, row.names = 1)
SNP_DATA <-data[,2:34]
d <- dist(SNP_DATA)
round(SNP_DATA.d)
(SNP_DATA.hc <- hclust(d, method="average")) #"average" (= UPGMA)
############jaccard's genetic similarity coefficient###########
setwd("C:/Users/Ryo Uenoyama/Desktop")
#install.packages("vegan")
library(readr)
library(vegan)
data <- read.csv('snpscore_all_accesions2.csv', header=T, row.names = 1)
SNP_DATA <-data[,2:34]
SNP_DATA.d <-vegdist(SNP_DATA,method="jaccard", binary = TRUE)
round(SNP_DATA.d)
(SNP_DATA.hc <- hclust(SNP_DATA.d, method="average")) #"average" (= UPGMA)
SNP_DATA.hc$height #see the value of height
mean(SNP_DATA.hc$height)
max(SNP_DATA.hc$height)
#########black coler dendrogram#####################
par(font=2) #2=bold
par(mar = c(2, 3.5, 1, 0)) #  �]���̍L��(���C���C��C�E)
par(family = "calibri") #letter
plot(SNP_DATA.hc, 
     lwd="4",
     cex      = 1.2,     #  �n���̕����̑傫��
     cex.lab  = 1.5,       #  "height"�̑傫��
     cex.axis = 1.5,      #  height�̃��x���̑傫��
     cex.main = 1.8     #  ���C���^�C�g���̎��̑傫����ݒ肷��
      )
#########colerd dendrogram##########################

dev.off()
library(RColorBrewer) 
display.brewer.all() 
#display.brewer.pal(8, "Set1") #showing interested color set

cols = brewer.pal(8, "Set1") #setting the col parret


#install.packages('dendextend')
library(dendextend)
par(font=2) #2=bold
par(lwd=4) #letter width
par(cex =1.4)#letter size
#par(mar = c(1, 5, 1, 0)) #  �n�����]���̍L��(���C���C��C�E)
par(family = "calibri") #letter
hcd <- as.dendrogram(SNP_DATA.hc, hang = 0.1)

d1 <- color_branches(hcd,k=10,
                     col =c("#3eb370",  #cluter1
                            "#93ca76",  #cluster2
                            "#8d6449",  #cluster3
                            "#19448e",  #cluster4
                            "#ec6800",  #cluster5
                            "#e6b422",  #cluster6
                            "#38a1db",  #cluster7
                            "#ea5506",  #cluster8
                            "#ad7d4c",  #cluster9
                            "#cc7eb1"   #cluster10
                            ))
#d1 <- color_branches(hcd,k=10, col = c(cols[1],cols[2], cols[3])) #col = c(3,2)
#d1 <- color_branches(hcd,k=14, col = cols)

plot(d1,
     lwd="1",
     cex  = 2, #letter size but there is par()now
     xlab = "",
     ylab = "Height",
     cex.lab  = 1.5,       #"height"�̑傫��
     cex.axis = 1,      # height�̃��x���̑傫��
     cex.main = 1.8     #���C���^�C�g���̎��̑傫����ݒ肷��
     )


dev.off()
c1801[,2:3]
snpscore1205forPCA[,2:33]
pch = c(1, 16)[d$sp]
SNP_DATA2 <- t(SNP_DATA)
library(pvclust)
dendro.pvwar <- pvclust(SNP_DATA2, method.dist = "euclidean",
                        nboot = 10, method.hclust = "average")
plot(dendro.pvwar, print.pv = T, print.num = T, cex.pv = 0)

#SE
par(mar = c(5, 5, 5, 5)) #  �]���̍L��(���C���C��C�E)
seplot(dendro.pvwar, identify=TRUE) #�N���b�N�����_���\�������I
print(dendro.pvwar, which=c(54, 60, 56, 40, 68))
