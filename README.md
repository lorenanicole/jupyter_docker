#### Jupyter Docker Example

To create a Docker image and run a container, follow these steps:

1. Choose a Docker client (e.g. Docker for Mac) and install it!
2. `docker build --rm -t 'image_name' .` The `--rm` removes the latest image and tags (`-t`) the new image built.
3. `docker run -d -ti -p 8888:8888 -v ~/local_path/to/notebooks:/home/jupyter/notebooks image_name`. You run the Docker container detached `-d` interactively `i` on port `-p` 8888. The volume `-v` flag permits you to mount a local data directory from host to the Docker container to the specified volume path in the Dockerfile. The Docker image when `build` only has the notebooks specified in the Dockerfile. By specifying a volume, you can allow the Docker container to work with whatever new notebooks are on the host machine and make changes to that host's data directory when the image is stopped/paused. 
4. Navigate to `localhost:8888` in your browser to open up Jupyter!

After the image is built, and you `run` the image the you can bind whichever port you want from your machine to the Docker port. However by default Jupyter runs on port `8888` and the Dockerfile has `EXPOSE 8888`. You will need to change the Dockerfile port if you want Docker to spin up Jupyter on a different port.

If you'd like to connect to the docker container you'll need to `docker ps` and grab the container ID to `docker exec -i -t container_id /bin/bash`.

For more information on how to use `-v` read the Docker [volume](https://docs.docker.com/engine/tutorials/dockervolumes/#add-a-data-volume) directions.

Additionally when you are done you may wish to `pause` or `stop` your container. You can read more about this via `docker --help`.

