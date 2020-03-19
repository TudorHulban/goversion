FROM golang:1.13.1-alpine3.10
RUN apk add git
WORKDIR /app

RUN git clone https://github.com/TudorHulban/goversion
RUN cd goversion &&  \
export VERSION="$(git describe --tags --always --dirty)" \
&& echo  $VERSION \
&& go build -ldflags "-X main.version=$VERSION" -o go_app goversion.go

CMD ["./goversion/go_app"]
