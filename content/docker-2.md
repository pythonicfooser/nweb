Title: Docker ENTRYPOINT vs CMD
Date: 2020-10-04 19:15
Category: Docker

# Docker ENTRYPOINT vs CMD

## CMD

CMD is a runtime instruction that is executed when the container is started. On the Dockerfile, we could add it with:

```
CMD ['executable', 'param1', 'param2']

or 

CMD executable param1 param2
```
The differences between these CMD instructions is that on first CMD, we could specify the full path of the binary to avoid "spawning" a shell.
If the use:

```
CMD ["/bin/ping", "-c 3 unizar.es"]
```

We will use the ping executable without using a sh shell. If we use with approach:

```
CMD ping -c 3 unizar.es
```

We will be executing:

```
/bin/sh ping -c 3 unizar.es
```

When we run a container, alpine as an example, we could check the default CMD that will be executed:

```
$ docker image inspect alpine | jq .[0].Config.Cmd

or

$ docker image inspect -f "{{.Config.Cmd}}" alpine
```

Where the output is:

```
[
  "/bin/sh"
]
```

Here, a shell will be executed, but we could replace that CMD on container start with:

```shell
$ docker container run -it alpine ping -c 3 unizar.es
```

It will replace the /bin/sh with the ping command, at runtime.

## ENTRYPOINT

Entrypoint, like CMD, is a runtime instruction, but the executable/command provided during the build time couldn't be overriden at runtime.

In the Dockerfile, the ENTRYPOINT seems like this:

```
ENTRYPOINT ["executable", "param1", "param2"]

Or combine it with the CMD

ENTRYPOINT ["executable"]
CMD ["param1", "param2"]

Like:

ENTRYPOINT ["/bin/ping"]
CMD ["unizar.es"]
```

Where at runtime, we could change the domain/IP to ping:

```shell
$ docker container run --ti --rm alpineping:0.1 google.com
```

Here we are replacing the part of the CMD, but NO the Entrypoint.

But, if we need to replace the Entrypoint of the image, we could use:

```shell
$ docker container run -it --rm --entrypoint /bin/sleep alpineping:0.1 5
```

Where the "ENTRYPOINT" will be /bin/sleep and the CMD (acting like a param) will be 5 (seconds to sleep).

###Extra info:

..* CMD -> Could be more than one on the Dockerfile, but only te last one will be executed.
..* ENTRYPOINT -> Only one per Dockerfile. Same as CMD, last will be executed.
