container_name=layer_builder_podman
podman_image=layer_builder_image

podman build -t $podman_image .
podman run -td --name=$container_name $podman_image
podman cp ./requirements.txt $container_name:/

podman exec -i $container_name /bin/bash < ./docker_install.sh
podman cp $container_name:/python_layer.zip python_layer.zip
podman stop $container_name
podman rm $container_name