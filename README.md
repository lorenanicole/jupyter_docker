###Jupyter Docker Example

To create a Docker image and run a container, follow these steps:

1. Choose a Docker client (e.g. Docker for Mac) and install it!
2. `docker build --rm -t 'image_name' .`
3. `docker run -d -ti -p 8888:8888 image_name`

After the image is built, and you `run` the image the you can bind whichever port you want from your machine to the Docker port. However by default Jupyter runs on port `8888` and the Dockerfile has `EXPOSE 8888`. You will need to change `start.sh` script and the Dockerfile port if you want Docker to spin up Jupyter on a different port.

If you'd like to connect to the docker container you'll need to `docker ps` and grab the container ID to `docker exec -i -t container_id /bin/bash`.

You can modify the Dockerfile to use the `-v` flag to mount a volume when you `docker run` specifying a volume you'd like to mount to various Jupter notebooks.

Additionally when you are done you may wish to `pause` or `stop` your container. You can read more about this via `docker --help`.

