library(EBImage)
x <- readImage(system.file('images','shapes.png', package='EBImage'))
x <- x[110:312,1:130]
y <- bwlabel(x)
display(y, title='Binary')

#Question 1. Jelaskan apa maksud dari potongan kode di atas?


#Unduh citra buah (cth:alpukat) dari internet,dan baca melalui R
original_image <- readImage(file.choose())
display(original_image)
r = channel(original_image,"r")
g = channel(original_image,"g")
b = channel(original_image,"b")
new_image = 0.2126*r+0.7152*g+0.0722*b
display(new_image)
#Question 2. Jelaskan apa maksud dari potongan kode di atas? Copy hasil display ke dalam box di bawah ini


Dataimage <- new_image@.Data
Subdata1 <- Dataimage[110:312,130:200]
display(Subdata1)
Subdata2<- Dataimage[c(1:40, 100:150, 350:400 ), c(1:40, 100:150, 250:300 )]
display(Subdata2)

#Question 3. Jelaskan apa maksud dari potongan kode di atas? Copy hasil display ke dalam box di bawah ini


# Unduh citra buah lain, dan lakukan langkah yang sama dengan sebelumnya
original_image <- readImage(file.choose())
display(original_image)
r = channel(original_image,"r")
g = channel(original_image,"g")
b = channel(original_image,"b")
new_image2 = 0.2126*r+0.7152*g+0.0722*b
display(new_image2)
Dataimage2 <- new_image2@.Data
Subdata3 <- Dataimage2[110:312,130:200]
display(Subdata3)
Subdata4<- Dataimage2[c(1:40, 100:150, 350:400 ), c(1:40, 100:150, 250:300 )]
display(Subdata4)
# Ekstrak nilai citra dengan nama DataImage2
Dataimage2 <- Dataimage2[1:dim(Dataimage)[1], 1:dim(Dataimage2)[2]]
obs1 <- as.vector(t(Dataimage))
obs2 <- as.vector(t(Dataimage2))
obs_gabung <- rbind(obs1,obs2)
dataset_buah <- as.data.frame(obs_gabung)
klas<- c("alpokat", "pisang")
dataset_buah_baru<-cbind(dataset_buah, klas)
dim(dataset_buah_baru)
length(dataset_buah_baru)  
dataset_buah_baru[1,640001]
dataset_buah_baru[2,640001]


url = "https://vincentarelbundock.github.io/Rdatasets/csv/MASS/Pima.te.csv"
dtf <- read.csv (file = url, header = T)
View(dtf)
smp_size <- floor(0.8 * nrow(dtf))
#Membagi data menjadi training dan testing
#Install.packages('caTools')
library(caTools)
set.seed(123)
train_data <- sample(seq_len(nrow(dtf)), size = smp_size)
train <- dtf[train_data, ]
test <- dtf[-train_data, ]

#crossvalidation


#install.packages("e1071")
#install.packages("ggplot2")
#install.packages("caret")
library(lattice)
library(robustbase)
library(cvTools)
library(e1071)
library(ggplot2)
library(caret)
url ="https://vincentarelbundock.github.io/Rdatasets/csv/MASS/Pima.te.csv"
datadiabet <- read.csv(url, header = TRUE)
data_yes <- datadiabet[datadiabet$type == "Yes",]
data_yes <- head(data_yes, n = 100)
data_no <- datadiabet[datadiabet$type == "No",]
data_no <- head(data_no, n = 100)
data_yes_no <- rbind(data_yes, data_no)
fold <- cvFolds(nrow(data_yes_no), K=8, R=1, type="random")
k=8
dtrain <- data_yes_no[fold$subsets[fold$which != k],]
dtes <- data_yes_no[fold$subsets[fold$which == k],]
model.nB <- naiveBayes(as.factor(type)~., dtrain)
#hasil prediksi
prediksi <- predict(model.nB, dtes)
prediksi
table(prediksi,true=dtes[,9])
#confusion Matrix
hasil=confusionMatrix(table(prediksi,true=dtes[,9]))
hasil





















