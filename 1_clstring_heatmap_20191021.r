library(gplots)
#setwd("C:\\Users\\infobio\\Desktop\\program\\ruby\\phylogenetic_profiling")

#���̖��߂ŃJ�����g�f�B���N�g�����ړ����܂��B�f�[�^�̓������ꏊ���w�肵�Ă��������B
#setwd("C:/Users/infobio/Desktop/phylogenetic_analyses/phylogenetic_analyses_data")

#�^�u��؂�ŋL�q�����n���v���t�@�C���f�[�^��ǂݍ��܂���B
data <- read.delim("test_out1.txt", header=T,row.names=1, sep="\t")
data<-t(data)


 h <- heatmap.2(as.matrix(data),
                # dendrogram control
                Rowv           = TRUE,
                Colv           = FALSE,
                distfun        = function(r) dist(r,method="manhattan"),
                hclustfun      = function(d) hclust(d,method="ward.D"),
                dendrogram     = c("row"), # both, row, column, none
                symm           = FALSE,
                scale          = c("none"),
 
                # color-)
                col            =  #cm.colors(100),  # redgreen(75) # �ԗ�
                   grey(0:99/100)[100:1],
                trace          = c("none"),
                margin         = c(2,2),
                #ColSideColors  = cc, #rainbow(ncol(x), start=0, end=.3)
                #RowSideColors  = rc1, #rainbow(nrow(x), start=0, end=.3)
                #cexCol         = 1,
 
                # color key  density
                key            = FALSE,
                #keysize        = 1.0, 
 
                # plot label
                #main           = NULL, # "Heatmap of PM",
                #xlab           = "MACCS",
                #ylab           = "compound",
                cexRow         = 0.5,
               )

               
dev.print(png, file="1_result_clustring_heatmap.png", width=750, height=750)

dev.off()


old.op <- options(max.print=999999)
sink("result_clustring_carpet.txt")	#�o�͐�

t(h$carpet) 
sink()


