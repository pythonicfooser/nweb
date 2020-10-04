Title: Docker Image creation, 1
Date: 2020-10-03 19:15
Category: Docker

# Docker image creation, 1

INTRO: This is a brief introduction to some options that are available to create new images from running containers.

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

And we could run the new image to check if changes were applied:

```shell
$ docker container run -it --rm alpinemod:0.1 sh
# cat bar
foo
```

Another option, is to export running container image to .tar

```shell
$ docker container export alpinebase > alpinemod.tar
```

And later on, import it:

```shell
$ docker image import tarFile newImageName:tag
```

As an example:

```shell
$ docker image import alpinemod.tar alpinemod:0.2
```

And we could start a new container with the "new" image:

```shell
$ docker container run -it --rm alpinemod:0.2 sh
# cat bar
foo
```
