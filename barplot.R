dev.off()
par(font=2) #2=bold
par(lwd=2)
par(family = "calibri") #letter
setwd("C:/Users/Ryo Uenoyama/Desktop/SNP")
data <- read.csv('flowering_accession.csv', header=T, row.names = 1)
#View(data)
barplot(height=data$flower,
        ylim =c(0, 30), #Y���̕\���͈͂̎w��D�x�N�g���Ŏw��
        cex.axis = 1.8, #Y�����x���̑傫��
        tcl=0.4,        #������������
        col = "#fabf14",
        )
box()                   #������