Q1 - mean(with(iris, subset(Sepal.Length, Species == 'virginica')))
Q4 - 
> tapply(mtcars$mpg, mtcars$cyl, mean)
       4        6        8 
26.66364 19.74286 15.10000 
> mean(with(mtcars, subset(mpg, cyl == 4)))
[1] 26.66364
> mean(with(mtcars, subset(mpg, cyl == 8)))
[1] 15.1
> abs(mean(with(mtcars, subset(mpg, cyl == 8)))- mean(with(mtcars, subset(mpg, cyl == 4)))
+ )
[1] 11.56364
> abs(mean(with(mtcars, subset(mpg, cyl == 8)))- mean(with(mtcars, subset(mpg, cyl == 4)))
