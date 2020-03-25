# Golang CI
## Docker tests with Golang
### Create image
```bash
make docker-build
```
### Commit image
```bash
docker commit <image ID> <new image name>
```
### Run Go binary in container
```bash
docker images -a # get image ID
docker run -p <external port>:<container port> <image ID / name>
```
