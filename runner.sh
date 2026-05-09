CONTAINER=layer_builder
IMAGE=layer_builder_img
RUNTIME=$(command -v podman || command -v docker)

$RUNTIME build -t $IMAGE .
$RUNTIME run -td --name=$CONTAINER $IMAGE
$RUNTIME cp ./requirements.txt $CONTAINER:/

$RUNTIME exec -i $CONTAINER /bin/bash < ./docker_install.sh
$RUNTIME cp $CONTAINER:/tmp/python_layer.zip python_layer.zip
$RUNTIME stop $CONTAINER

$RUNTIME rm $CONTAINER
$RUNTIME rmi $IMAGE:latest

echo "Layer is ready..."
echo "Size: $(du -sh python_layer.zip)"