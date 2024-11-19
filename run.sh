CONTAINER_FILE=".docker_container_name"

# Checking if the user input  a parameter for setting as container name
if [ "$1" ]; then
    echo "$1" > "$CONTAINER_FILE"
    echo "Container name set to: $1"
    exit 0
fi

# Checking if the container name file exists
if [ ! -f "$CONTAINER_FILE" ]; then
    echo "Container name not set. Use './run.sh <container-name>' to set it."
    exit 1
fi

# Reading the active container name 
DOCKER_CONTAINER_NAME=$(cat "$CONTAINER_FILE")

# Running the Docker container with the container name variable 
docker run -it -v "$(pwd)/src:/app/src" "${DOCKER_CONTAINER_NAME}:latest"