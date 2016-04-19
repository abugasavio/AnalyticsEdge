
This repo contains my code and notes for [The Analytics Edge Class](https://www.edx.org/course/analytics-edge-mitx-15-071x-2#!) offered by MIT on EDX from 14th April 2016.

# The Analytics Edge

Through inspiring examples and stories, discover the power of data and use analytics to provide an edge to your career and your life.

### Important Notes

#### [Suggestion from past student](https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/discussion/forum/i4x-MITx-15.071x_2-course-1T2015/threads/570d0b84209a65053f000312)
I've taken this course twice and enjoyed it immensely both times. I was a complete R newbie the first time and it was a mighty struggle but I learned a tremendous amount and am now able to get done in R what I need to get done (although I am far from an R expert).
Here are some tips to making this a better learning experience.

* Save your scripts. All of them. They will be immensely useful later.
* Use RStudio instead of R - RStudio is an open source integrated development environment (IDE) that is much more pleasant to work in than the R console.
* Search the Discussion Forum when you run into problems. It is likely someone else had the same challenge you did.
You will find experts here in the forum and they will be willing to help.
* Get acquainted with stackoverflow - it's a wonderful resource.
Learn how to present a minimal, complete, and verifiable problem when asking for help.
* Practice, practice, practice, and practice some more. Unless you have a strong coding background the course will be a challenge and will require a great deal of effort.
* Don't be discouraged. This is a Masters-level course at MIT, one of the best quantitative higher learning institutions in the world. Most of the students taking it on campus are the smartest kids in the smartest row. It is not intended to be easy. Without a coding and statistics background this will be a very challenging course.
But you can do it if you devote the time and effort!

Best wishes on this exciting journey!
Bill

# Notes
Combining graphs.
The following code will produce two lines in one graph.

```
plot(CocaCola$Date, CocaCola$StockPrice, type="l", col="red")

lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue")
```

Drawing a vertical line on a graph.
```
  abline(v=as.Date(c("2000-03-01")), lwd=2)
```

The above code will draw a vertical line on x-axis 2000-03-01 of width 2.

To see available colors in R use the `colors()` command

To use different line types use the argument `lty` in the `plot` method.

- lty = 2: Dashed line
- lty = 3: Dotted line
- lty = 4: Alternate between dashes and dots
- lty = 5: Long-dashed

## (Using `tapply()` to get proportions)[https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/discussion/forum/78e20dc705de4a87986c2bcd1321b23a/threads/5712a71bdb70a905a80000e7]


Here `tapply()` takes three parameters.
The (the 3rd parameter in tapply) is applied to the first parameter of tapply
(the argument of the function).
The second parameter of tapply provides the grouping/categorization.
So in order to calculate a proportion with tapply and the mean function as 3rd parameter,
the 1st parameter must be a boolean (0 or 1), for instance the result of a comparison.


## Frequency tables

How many cars from the R built-in dataset mtcars have 4 gears?

```
> CarGears = table(mtcars$gear)
> CarGears
```

 3  4  5\
15 12  5

How do I access the number of cars using variables?

1. Convert the `table` to `dataframe`
    ```
    > CarGears = as.data.frame(CarGears)
    > CarGears
    ```

    &nbsp;&nbsp;Var1 Freq\
    1    3   15\
    2    4   12\
    3    5    5

2. Change the name `Var1` to `Gear`
    names(CarGears)[1] = 'Gear'
    ```
    CarGears
    ```

&nbsp;&nbsp;   Gear Freq\
1    3   15\
2    4   12\
3    5    5

3. Now you can access the frequency using variables:
  ```
  ThreeGears = CarGears[CarGears$Gear=="3", c("Freq")]
  FourGears = CarGears[CarGears$Gear=="4", c("Freq")]
  FiveGears = CarGears[CarGears$Gear=="5", c("Freq")]
  ```

You can also use `count()` from [plyr](https://cran.r-project.org/web/packages/plyr/plyr.pdf)

`install.packages('plyr')`

`library(plyr)`

 Count of gears:

`count(mtcars, vars = "gear")`

&nbsp;&nbsp;gear freq\
1    3   15\
2    4   12\
3    5    5

## Merging tables

To merge data frames horizontally use the `merge()` function.

```
  # merging two data frames by MetroAreaCode
  CPS = merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
```

The first two arguments determine the data frames to be merged (they are called
"x" and "y", respectively, in the subsequent parameters to the merge function).
by.x="MetroAreaCode" means we're matching on the MetroAreaCode variable from the
"x" data frame (CPS), while by.y="Code" means we're matching on the Code variable
from the "y" data frame (MetroAreaMap). Finally, all.x=TRUE means we want to keep
all rows from the "x" data frame (CPS), even if some of the rows' MetroAreaCode
doesn't match any codes in MetroAreaMap (for those familiar with database
terminology, this parameter makes the operation a left outer join
instead of an inner join).
