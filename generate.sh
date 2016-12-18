#!/usr/bin/env bash

# python environmont
source ../exako/venv/bin/activate

protoc -I=. --python_out=../exako/src/protobuf database.proto
protoc -I=. --python_out=../exako/src/protobuf rest_request.proto

deactivate

# js part
pbjs -t static-module -o ../exyui/src/proto/models.js database.proto rest_request.proto
pbts -n RestProto -o ../exyui/src/proto/models.d.ts ../exyui/src/proto/models.js
