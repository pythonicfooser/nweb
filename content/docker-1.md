Title: Docker Image creation, 1
Date: 2020-10-03 19:15
Category: Docker

# Docker image creation, 1

Create Docker image from running container:

We could start a test container, like:

`$ docker container run -it --rm --name alpinebase alpine sh`

Add for example a file to the container:

`$ echo "foo" > /bar`

Later on, dettach from container with Ctrl + p and Ctrl + q. We could check the changes applied to the base image:

`$ docker container diff alpinebase`

The output:

`A /bar
C /root
A /root/.ash_history`

Here we could see that the Shell history and our new file were modified. Create the new image from the running one:

`$ docker container commit [runningContainer] [imagename:tag]`

In our case:

`$ docker container commit alpinebase alpinemod:0.1`


