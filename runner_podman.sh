container=layer_builder_container
image=layer_builder_image

podman build -t $image .
podman run -td --name=$container $image
podman cp ./requirements.txt $container:/

podman exec -i $container /bin/bash < ./docker_install.sh
podman cp $container:/tmp/python_layer.zip python_layer.zip
podman stop $container
podman rm $container
podman rmi $image:latest