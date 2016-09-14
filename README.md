# devtop
Linux developer environment for everyone in a docker container.

Developer virtual desktop docker container, accessible via Windows Remote Desktop client. Can be launched in Amazon, GoogleCompute, or any other cloud. Devtop uses port 3389 for rdp connection.

## Starting it up

``
$ docker run -d -P belooussov/devtop:latest
``

Docker will download and launch the container automatically.

## Connecting to your linux devtop

On Windows platform, use "remote desktop" utility.

On Linux/Unix, use either "rdesktop" or "tsclient":

``
$ rdesktop -f 172.17.0.2
``

## Username and password

Username: root

Password: password

You can change the password in any shell running inside the container, or by adjusting the Dockerfile and rebuilding the image.

## Requirements
Docker 1.10 or higher.
