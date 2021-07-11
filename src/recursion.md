
# Lesson Plan for Recursion

### Example 1

A recursive function is a function that makes a call to itself.

```cpp
void recurse(uint remaining) {
	cout << remaining;
	if (remaining > 0) {
		recurse(remaining - 1);
	}
}
```

Each time this function runs, it checks if the value it recieved for `remaining` is greater than zero. If not, it calls itself with the value of `remaining` minus `1`.

The output would look something like:

```
5
4
3
2
1
0
```

### Example 2


Consider instead this similar recursive function:

```cpp
void recurse(uint remaining) {
	if (remaining != 0) {
		recurse(remaining - 1);
	}
	cout << remaining;
}
```

In this case, the recursive call is made _before_ writing to STDOUT. Intead of printing the value of `remaining` and then proceeding to the next call, the next call is executed first.

The output would look something like:

```
0
1
2
3
4
5
```

### Check Your Understanding

What do you think this code would do?

```cpp
void recurse(uint remaining) {
	cout << remaining;
	recurse(remaining - 1);
}
```

## Tail recursion vs General Recursion

In the second example, the recursive call is made before the end of the function. The compiler can't be certain that local variables used by the function do not need to be accessed later on in the function block. Therefore each successive call needs to have its own memory allocated for local variables. This process of expanding a sequence of function calls is known as a callstack. This is what's known as __general recursion__, where the recursive call is made anywhere inside the function block.

In the first example, though, the recursive call is made at the end of the function block. This means that there are no more statements to execute in that block and the memory allocated to local variables can be released or better--reused! Indeed, the compiler can reuse the local variables in the function block, meaning the callstack, and therefore memory usage, does not increase. Placing the recursive call at the end of the function block is known as __tail recursion__ and allows for this powerful compiler optimization.

In practice, general recursive functions are more likely to cause the program to run out of memory. If tail recursion is possible for your function, you should usually make use of it.
