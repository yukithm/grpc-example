GOPATH:=$(shell go env GOPATH)
REPO:=github.com/yukithm/grpc-example

.PHONY: proto mock test

proto:
	go get github.com/golang/protobuf/protoc-gen-go
	protoc -I helloworld/ helloworld/helloworld.proto --go_out=plugins=grpc:helloworld

mock:
	go get github.com/golang/mock/gomock
	go get github.com/golang/mock/mockgen
	install -d mock_helloworld
	mockgen $(REPO)/helloworld GreeterClient > mock_helloworld/hw_mock.go

test:
	go test -v ./... -cover
