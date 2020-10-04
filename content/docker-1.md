Title: Docker Image creation, 1
Date: 2020-10-03 19:15
Category: Docker

# Docker image creation, 1

Create Docker image from running container:

We could start a test container, like:

```shell
$ docker container run -it --rm --name alpinebase alpine sh
```

Add for example a file to the container:

```shell
$ echo "foo" > /bar
```

Later on, dettach from container with Ctrl + p and Ctrl + q. We could check the changes applied to the base image:

```shell
$ docker container diff alpinebase
```

The output:

```shell
A /bar
C /root
A /root/.ash_history
```

Here we could see that the Shell history and our new file were modified. Create the new image from the running one:

```shell
$ docker container commit [runningContainer] [imagename:tag]
```

In our case:

```shell
$ docker container commit alpinebase alpinemod:0.1
```


