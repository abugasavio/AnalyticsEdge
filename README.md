
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
