# Perintah untuk build Docker image dari Dockerfile
docker build -t aldaaa/karsajobs-ui:latest -f Dockerfile .

# Mengubah nama image agar sesuai dengan format GitHub Container Registry
docker tag aldaaa/karsajobs-ui:latest ghcr.io/aldaaaaa/a433-microservices/karsajobs-ui:latest

# Perintah untuk login ke GitHub Container Registry (GitHub Package)
echo $GHCR_TOKEN | docker login ghcr.io -u aldaaaaa --password-stdin

# Perintah untuk push image ke GitHub Package
docker push ghcr.io/aldaaaaa/a433-microservices/karsajobs-ui:latest