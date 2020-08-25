# nQueensApp

A mobile application that gives you all the possible solutions for the famous n-Queens problem.

## what is the n-Queens problem ?
-  The n-Queens is the problem of placing n chess queens on an n×n chessboard so that no two queens attack each other.
-  This problem is a NP-complete problem.

## How to use the app ?
#### 1. select the chess board size
1.Select the chess board size            |  2.Hit GO and enjoy watching the solutions
:-------------------------:|:-------------------------:
![Menu page](https://github.com/younes38/nQueensApp/blob/master/screenshots/screen2.png)  |  ![Board page](https://github.com/younes38/nQueensApp/blob/master/screenshots/screen1.png)



## How does it work ?
I solved the problem using a brute force algorithm with some optimizations which are:
-  We use an array of n elements instead of using nxn arrays.
-  Whenever we find a case where two queens attack each other we stop that case.
