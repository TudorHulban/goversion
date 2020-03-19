# GolangCI
## Docker tests with Golang
### Create image
```bash
docker run golang go get -v github.com/TudorHulban/golangci
```
### Commit image
```bash
docker commit <image ID> <new image name>
```
### Run Go binary in container
```bash
docker run -p <external port>:<container port> <image ID / name>
```
