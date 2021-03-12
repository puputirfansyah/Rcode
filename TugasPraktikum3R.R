library(EBImage)
x <- readImage(system.file('images','shapes.png', package='EBImage'))
x <- x[110:312,1:130]
y <- bwlabel(x)
display(y, title='Binary')

#Question 1. Jelaskan apa maksud dari potongan kode di atas?
#Jawab:
#.....

#Unduh citra buah (cth:alpukat) dari internet,dan baca melalui R
original_image <- readImage(file.choose())
display(original_image)
r = channel(original_image,"r")
g = channel(original_image,"g")
b = channel(original_image,"b")
new_image = 0.2126*r+0.7152*g+0.0722*b
display(new_image)
#Question 2. Jelaskan apa maksud dari potongan kode di atas? Copy hasil display ke dalam box di bawah ini
#Jawab:
#......

Dataimage <- new_image@.Data
Subdata1 <- Dataimage[110:312,130:200]
display(Subdata1)
Subdata2<- Dataimage[c(1:40, 100:150, 350:400 ), c(1:40, 100:150, 250:300 )]
display(Subdata2)

#Question 3. Jelaskan apa maksud dari potongan kode di atas? Copy hasil display ke dalam box di bawah ini
#Jawab:
#.....

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
Dataimage <- Dataimage2[1:dim(Dataimage)[1], 1:dim(Dataimage2)[2]]
obs1 <- as.vector(t(Dataimage))
obs2 <- as.vector(t(Dataimage2))
obs_gabung <- rbind(obs1,obs2)
dataset_buah <- as.data.frame(obs_gabung)
klas<- c("alpokat", "apel")
dataset_buah_baru<-cbind(dataset_buah, klas)
dim(dataset_buah_baru)
length(dataset_buah_baru)  
dataset_buah_baru[1,640001]
dataset_buah_baru[2,640001]
#Question 4. Jelaskan apa maksud dari potongan kode di atas? Copy hasil display ke dalam box di bawah ini
#Jawab:
#......


