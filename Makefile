# variable definition section
BINARY_NAME	  ?= test01
VERSION       ?= $(shell git describe --tags --always --dirty)
LDFLAGS       ?= -X main.version=$(VERSION) -w -s
IMAGE         ?= "img_"$(BINARY_NAME)

# targets for build section.
.PHONY: build
build: clean ## Builds the binary.
	@echo "Building binary as $(BINARY_NAME)."
	@go build -v -o $(BINARY_NAME) $(BUILD_FLAGS) -ldflags "$(LDFLAGS)" .

.PHONY: docker-build
docker-build: ## Builds the docker image based on included Dockerfile.
	@echo "Building image $(IMAGE)"
	@docker build --no-cache --pull --build-arg GIT_CREDENTIALS -t $(IMAGE) .

.PHONY: clean
clean: ## Removes previously built artifacts.
	@echo "Removing any previous $(BINARY_NAME) binary."
	@rm -rf $(BINARY_NAME)
