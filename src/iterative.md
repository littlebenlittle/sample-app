
# Lesson Plan for Iterative Structures

Notionally, iterative structure or "loops" describe an action is that repeated until a condition is met.

There are many human examples:

> Wash your dishes until they are clean
> Jump rope until you've met your target heart rate for 12 minutes
> Pack your bag until all the items are put away

In computer science, however, we are usually working with data

> add 1 to the number referenced by x until x is greater than or equal to 7
> take an item from a list until the list is empty
> ask for the next message from a data stream until the stream sends a 'stop' message

There are three looping constructs in `c++`:

* the `while` loop
* the `do-while` loop
* the `for` loop

### the `while` loop

The `while` loop repeats a block of code until its condition evaluates to true.

```cpp
uint x = 0;
while (x <= 7) {
	cout << x;
	x++;
}
```

In this case, we assign the value `0` to an unsigned integer called `x`. We then confirm that `x` is indeed less than or equal to `7` and begin executing the loop body. We print the value of `x` to STDOUT and increment `x` until `x <= 7` evaluates to `false`.

```cpp
// define a file object
ifstream file;
// open a file into it
file.open('file.txt');
std::string line;
while (std::getline(file, line)) {
	cout << line;
}
```

First we open a file. In the loop body, we print each line to STDOUT. In the loop condition, we take advtange of the fact that `std::getline` returns `false` when all lines from the file have been read.

#### Check Your Understanding

What do you think the following code does?

```cpp
while (true) {
	cout << "ad infinitum";
}
```

### the `do-while` loopp

The `do-while` is very similar to the `while`, except that its code block gets executed _before_ the loop condition is evaluated. This is useful because sometimes we may want to ensure that the body of the loop is executed at least once.

```cpp
// set max to a random number from 0 to 9
uint max = rand() % 10;
uint x = 3;
do {
	cout << x;
	x++;
}while (x <= max)
```

In this case, it is possible that `x <= max` before our loop executes. Using `do-while` instead of `while` ensures that the value `3` is always sent to STDOUT at least once.

#### Check your understanding

What do you think the following code does?

```cpp
while (false) {
	cout << 'do you see me?';
}
do {
	cout << 'how about me?';
}while (false)
```

### the `for` loop

A `for` loop can be used to keep track of a counter while iterating. Consider the following code:

```cpp
uint x = 0;
while (x <= 7) {
	cout << x;
	x++;
}
```

Now consider this re-write using a `for` loop:

```cpp
for (uint x=0; x<=7; x++) {
	cout << x;
}
```

In this case, we assign `0` to a new variable x, demand the loop exits when `x <= 7`, and instruct the compiler to iterate `x` at the end of each loop iteration. Another notable feature of the `for` loop is that variable `x` is only defined for lexical scope of the loop body.

#### Check your understanding

What do you think the following code does?

```cpp
for (uint x=7; x>=0; x--) {
	cout << x;
}
```
