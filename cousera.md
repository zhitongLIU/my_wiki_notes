# gradient decent

## Feature scalling
by scaling feature gradient decent can converge quicker

size: 0-2000 feet
room: 0-5 room
x1 = size / 2000
x2 = rooms / 5

is not good to scale too small or too large

## mean nomalization
if average of the size is 1000 and average room is 2
we could use mean normalization
x1 = (size - 1000) / 2000
x2 = (size - 2) / 5

to make:
-0.5 <= x1 <= 0.5
-0.5 <= x2 <= 0.5

x = (x - u) / s

u = avg value
s = range

## making sure gradient descent is working

J(x) (loss function) and a (iteration step) should like e^-x

for sufficiently small a, j(x) should decrease on every interation
if a is too small: slow converge

## normal equation

theta is the solve of each features
```
theta = (x^T * x) ^(-1) * x^T * y
```

octave pinv(inverse)
```
pinv(x' * x) * x' * y
```

- no need to choose a
- don't need to iterate
- slow if features n is very large
- need to compute (x^T * x) -1  which is nxn is O(n3) compute time

n >= 10000 is large for modern computer

