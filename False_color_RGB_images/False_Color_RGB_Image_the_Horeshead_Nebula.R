################################
#  R. Retkute
#  2019
################################

###  Images downloaded from the NASA Infrared Science Archive:
###   https://irsa.ipac.caltech.edu/frontpage/
###  Images: Barnard 33 + 20 arcmin  / The Horsehead Nebula


library(imager)
library(magick)

# Upload infrared images
blue.channel <- imsplit(load.image("wise-3a-1.png"),"c")[[1]]
green.channel <- imsplit( load.image("wise-3a-3.png"),"c")[[1]]
red.channel <- imsplit(load.image("wise-3a-4.png"),"c")[[1]]

#Bind the three channels into one image
img <- imappend(list(red.channel, green.channel, blue.channel),"c")
# Color inversion 
img <- image_negate(image_read(img))


# Plot 
par(mfrow=c(2,2))
plot(red.channel, axes=F, main="Red channel")
plot(green.channel, axes=F, main="Green channel")
plot(blue.channel, axes=F, main="Blue channel")
plot(img)

