
# How do Neural Networks learn? 

Training a neural network has never been easier. You define the architecture with `Keras`  (or `PyTorch`, if you know what's good), set the optimizer and run the `model.train` command. Many times, most people don't pay attention to the optimizer. The would use Adam and start the training. However, as you get involved with architectures a bit more complex than the classical feed-forward neural network for the MNIST digits dataset, you may come across quite a frustrating situation: after a few epochs, the model won't improve the loss metric. And maybe (just maybe) the reason could be the optimizer you are using. 

### Gradient descent: how to learn from the mistakes 

 So, how exactly does a neural network learn from its mistakes? The answer lies in one of the simplest yet powerful ideas in optimization: **gradient descent**. 

The gradient of the loss with respect to a certain parameters tells us the direction in which te loss increases the most. So, to reduce the loss, we should take a small step in the opposite direction. Mathematically, we usually represent the model's parameters with the Greek letter $\theta$, and $\mathcal{L}(\theta)$ is the loss function. Hence, the update rule is: 
$$
\large \theta \leftarrow \theta - \eta \cdot \nabla_{\theta} \mathcal{L}(\theta)
$$
Here, $\eta$ is the **learning rate**, a small constant which controls the step size. Repeat this process over and over, and the model will gradually adjust its parameters to reduce the error, ideally finding a minimum of the loss function. Here is a visual representation of this process: 

![gradient_descent](gradient_descent.png)

# Hands-on exercise: training a neural network 

Even though it is important to have a solid grasp of the theory, one must be able to quickly detect the problems when working in a real scenario. To connect theory with practice, we are going to run the most typical experiment: **MNIST digit recognizer**. 