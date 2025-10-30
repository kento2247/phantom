#!/bin/bash

IMAGE_NAME="phantom:3"
docker build -t $IMAGE_NAME .
docker run --gpus all -it --rm -v $PWD:/workspace -w /workspace $IMAGE_NAME bash