---
title: "Code Book"
author: "stully2"
date: "August 22, 2015"
output: html_document
---
#**Variables:**

----------------------

##Subject:

Integer numeric representation of individual experiment participants

##Act_Name:

Description of activity type that produced motion values


##General Breakout:

**Sample Header: tBodyAccJerk.MEAN_FUN.Y**


t &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |  Body &nbsp;&nbsp;&nbsp;&nbsp; |  Acc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |  Jerk &nbsp;&nbsp; |  .MEAN_FUN. |  Y

**Domain**  |  **Source**  |  **Motion**  |  **Force**  |  **Calculation**&nbsp; |  **Axis**

>**Domain:**

 > - t: Time based domain recorded at a constant frequency of 50 Hz 
 > - f: Time domain processed with Fast Fourier Transform (FFT)

>**Source:**

> -  Body:
> -  Gravity 

> The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

>**Motion:**

> -  Linear motion
> -  Angular motion

>**Force:**

> -  [Jerk](https://en.wikipedia.org/wiki/Jerk_%28physics%29): Impulse causing acceleration (time derivitive of Acceleration) [g/s]
> -  Null: Acceleration [g] (standard gravitational force)

>**Calculation:**

> -  .MEAN_FUN.: source files calculated using mean()
> -  .STR_FUN.: source files calculated using str()

>**Axis:**

> -  x: motion in the x direction
> -  y: motion in the y direction
> -  z: motion in the z direction
> -  Null: magnitude value
