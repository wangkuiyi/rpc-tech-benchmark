Build the Docker image that container TensorFlow, numpy, and protoc.

```bash
 docker build -t benchmark .
 ```

Run the Docker image:

```bash
docker run --rm -it -v $GOPATH:/go -v $HOME:/root -w /go/src/github.com/wangkuiyi/rpc-benchmark benchmark bash
```

 To run the Python protobuf serialization benchmark in the container: 
 
 ```bash
 python protobuf-serialize.py
```

To clone TensorFlow source code (only the most recent Git commit of a specified version):

```bash
git clone --single-branch --depth 1 --branch v2.0.0-beta1 https://github.com/tensorflow/tensorflow
```

To install the Go plugin of protobuf compiler

```bash
go get -u github.com/golang/protobuf/protoc-gen-go
```

To build `example.proto` and `feature.proto` into Go source code:

```bash
protoc --go_out=/go/src -I tensorflow tensorflow/tensorflow/core/example/feature.proto 
protoc --go_out=/go/src -I tensorflow tensorflow/tensorflow/core/example/example.proto
```
