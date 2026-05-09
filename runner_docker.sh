container=layer_builder_container
image=layer_builder_image

docker build -t $image .
docker run -td --name=$container $image
docker cp ./requirements.txt $container:/

docker exec -i $container /bin/bash < ./docker_install.sh
docker cp $container:/tmp/python_layer.zip python_layer.zip
docker stop $container
docker rm $container
docker rmi $image:latest