# devtop

Linux developer environment for everyone in a docker container.

Developer virtual desktop docker container, accessible via
Windows Remote Desktop client.
Can be launched in Amazon, GoogleCompute, or any other cloud.
Devtop uses port 3389 for rdp connection.

## Starting it up

``
$ docker run -d -p 3389:3389 mabeinnovations/devtop:latest
``

Docker will download and launch the container automatically.

## Connecting to your linux devtop

On Windows platform, use "remote desktop" utility.

On Linux/Unix, use either "rdesktop" or "tsclient":

``
$ rdesktop -f 127.0.0.1
``

## Username and password

Username: devtop

Password: password

You can change the password in any shell running inside the container,
by adjusting the Dockerfile and rebuilding the image, or by building
another image based on devtop and setting the password there.

## Requirements

Docker 1.10 or higher.
