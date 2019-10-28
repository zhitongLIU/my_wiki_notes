# Keras

##构筑模型
https://keras-cn.readthedocs.io/en/latest/layers/core_layer/
https://keras.io/zh/layers/writing-your-own-keras-layers/
```
model = keras.Sequential()
```

Sequential
序贯模型是函数式模型的简略版，为最简单的线性、从头到尾的结构顺序，不分叉，是多个网络层的线性堆叠。

使用.add()方法将各层添加到模型中
Dense层
Activation层
Dropout层
Flatten层
Reshape层
Permute层
RepeatVector层
Lambda层
```
keras.layers.core.Lambda(function, output_shape=None, mask=None, arguments=None)
```

-----

```
model.compile(optimizer="adam", loss='binary_crossentropy', metrics=['accuracy'])
```

优化器 optimizer：它可以是现有优化器的字符串标识符，如 rmsprop 或 adagrad，也可以是 Optimizer 类的实例。详见：optimizers。
损失函数 loss：模型试图最小化的目标函数。它可以是现有损失函数的字符串标识符，如 categorical_crossentropy 或 mse，也可以是一个目标函数。详见：losses。
评估标准 metrics：对于任何分类问题，你都希望将其设置为 metrics = ['accuracy']。评估标准可以是现有的标准的字符串标识符，也可以是自定义的评估标准函数。

##训练模型
```
fit_model = model.fit(x_train, y_train, epochs=40, batch_size=512, validation_data=(x_val, y_val), verbose=1)
```


##评估模型
```
result = model.evaluate(test_data, test_labels)
```


## activation functions
https://keras-cn.readthedocs.io/en/latest/other/activations/

- softmax：对输入数据的最后一维进行softmax，输入数据应形如(nb_samples, nb_timesteps, nb_dims)或(nb_samples,nb_dims)
- elu
- selu: 可伸缩的指数线性单元（Scaled Exponential Linear Unit），参考Self-Normalizing Neural Networks
- softplus
- softsign
- relu
- tanh
- sigmoid
- hard_sigmoid
- linear

## optimizer

- SGD
- RMSprop
- Adagrad
- Adadelta
- Adam
- Adamax
- Nadam

## loss functions
https://keras.io/losses/

- mean_squared_error
- mean_absolute_error
- mean_absolute_percentage_error
- mean_squared_logarithmic_error
- squared_hinge
- hinge
- categorical_hinge
- logcosh
- categorical_crossentropy
- sparse_categorical_crossentropy
- binary_crossentropy
- kullback_leibler_divergence
- poisson
- cosine_proximity
