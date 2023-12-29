FROM ghcr.io/swiftwasm/carton:main


ENV IN_DOCKER_CONTAINER Yes

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents (from your machine) to the container at /app
ADD . /app


EXPOSE 8080

CMD ["carton", "dev"]

