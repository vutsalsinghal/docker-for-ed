DOCKER_USER = gcallah


# Docker commands:

build-images: build-cpp build-pl

build-docker-images: build-docker-cpp build-docker-pl

push-images: push-cpp push-pl

build-cpp:
	docker build -t cplusplus docker_images/cpp/

build-docker-cpp:
	docker build -t $(DOCKER_USER)/cplusplus docker_images/cpp/

# I don't recommend things we run like this to be in makefile:
# reserve this for builds. make a shell script for running things.
run-interactive-cpp:
	docker run --rm -it --name cppcontainer $(DOCKER_USER)/cplusplus bash

push-cpp:
	docker push $(DOCKER_USER)/cplusplus

build-pl:
	docker build -t pl docker_images/pl/

build-docker-pl:
	docker build -t $(DOCKER_USER)/pl docker_images/pl/

# Again, I don't think the runs should be in the makefile:
run-interactive-pl:
	docker run --rm -it --name plcontainer $(DOCKER_USER)/pl bash

push-pl:
	docker push $(DOCKER_USER)/pl


# React gh-pages commands:

build-react:
	rm -r static && \
	rm precache-manifest* && \
	cd docker_for_edu_site && \
	npm run build && \
	cp favicon.ico build && \
	cp -r build/* .. && \
	cd ..

start-local:
	cd docker_for_edu_site && \
	npm start


# Tests

test-docker-pl:
	pytest -v tests/test_docker-pl.py

test-cpp:
	pytest -v tests/test_docker-cpp.py

run-all-tests:
	pytest -v tests
