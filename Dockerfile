FROM tensorflow/tensorflow:2.0.0b1-py3

RUN apt-get update && apt-get install -y curl git unzip
RUN curl --silent https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz go.tar.gz | tar -C /usr/local -xzf -
ENV PATH=/usr/local/go/bin:$PATH

RUN pip install --upgrade pip
RUN pip install setuptools-golang pytest-runner pytest numpy

RUN curl --silent -OL https://github.com/google/protobuf/releases/download/v3.7.0/protoc-3.7.0-linux-x86_64.zip && unzip protoc-3.7.0-linux-x86_64.zip -d protoc3 && mv protoc3/bin/* /usr/local/bin/ && mv protoc3/include/* /usr/local/include/

RUN mkdir -p /go/src
ENV GOPATH=/go
ENV PATH=$PATH:/go/bin

RUN go get -u github.com/golang/protobuf/proto
