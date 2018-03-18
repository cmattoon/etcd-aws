FROM golang:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

ENV GOROOT=/usr/local/go
ENV GOPATH=/app

RUN go get ./...


#ADD dist/cacert.pem /etc/ssl/ca-bundle.pem
ADD dist/etcd.Linux.x86_64 /bin/etcd
ADD dist/etcd-aws.Linux.x86_64 /bin/etcd-aws
ENV PATH=/bin
ENV TMPDIR=/
CMD ["/bin/etcd-aws"]
