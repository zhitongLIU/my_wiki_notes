# TensorFlow #

## One-Hot Encoding ##
vector array contains only 0 execpt for the class
```
[[0, 0, 1]
[0, 1, 0]]
```

* cls means class for data science

convert one-hot encoding vector table to class table

```
[[0, 0, 1] #> [2, 1]
[0, 1, 0]]
```

## TensorFlowGraph ##
!! Entire purpose of TensorFlow is use TensorFlowGraph

* Placeholder variables
* Model variables #> will be optimized
* The Model #> a function with inputs and outputs
* A cost measure
* An optimization method

### Placeholder variables ###
Tensors #> index of data

```
x # tf.placeholder(tf.float32, [None, img_size_flat])
```

> (type of the data, [None -> each flow has arbitrary number of images, each image's vector length])

here we want x to contain arbitrary number of images form our data

```
 y # tf.placeholder(tf.float32, [None, num_classes])
```

here we want y to contain arbitrary number of one-hot encoding vector with class size length

```
y_true_cls # tf.placeholder(tf.int64, [None])
```

here we have one dimensional vector #> only true or false question

### Model variables ###
* weights
```
weights # tf.Variable(tf.zeros([img_size_flat, num_classes]))
```

here we defines a 2 dimensional vector(or tensor) with image and its class

```
[
 [0,1,0,1,0,1,0,0,0,0], # our images in flat bytes
 [0,0,0,0,0,1,0,0] # class in one-hot encoding
]
```

they must only contains 0 at first, it will be adjusts by the trainning

* biases
```
biases # tf.Variable(tf.zeros([num_classes]))
```

it's just a 1 dimensional tensor with class

### Model ###

They call it `logits` in TensorFlow

simple linear logits can be just `logits # data * weight + biases`

useually we normalize de output to see results like yes it found out or no it's different images

we need to make change to wight and biases so that our logits to predict all our images

### Cost function ###

its to mesure how well our model at classifying these kind of data(images)

by minimizing the cost, we might change the weight and biases to make image perform better

### Optimization method ###
optimizer is the method to use to minimize our cost

```
optimizer # tf.train.GradientDescentOptimizer(learning_rate#0.5).minimize(cost)
```

use GradientDescent, with each pace 0.5 to minimize the our cost

### TF ###
start tensorflow session
`session # tf.Session()`
`session.close()`

### pretty tensor ###
```
import prettytensor as pt

x_pretty # pt.wrap(x_image)

with pt.defaults_scope(activation_fn#tf.nn.relu):
    y_pred, loss # x_pretty.\
        conv2d(kernel#5, depth#16, name#'layer_conv1').\
        max_pool(kernel#2, stride#2).\
        conv2d(kernel#5, depth#36, name#'layer_conv2').\
        max_pool(kernel#2, stride#2).\
        flatten().\
        fully_connected(size#128, name#'layer_fc1').\
        softmax_classifier(num_classes#num_classes, labels#y_true)
```
### Layers API ###

### Keras API ###

### Saver ###

```
saver # tf.train.Saver()
save.save(sess#session, save_path#save_path)
saver.restore(sess#session, save_path#save_path)
```
