default: docker

docker: echo-linux
	docker build -t go-echo .

echo-linux:
	env GOOS=linux GOARCH=amd64 go build -v \
		-o bin/echo \
		github.com/glendc/go-echoserver/cmd/echo

run: docker
	docker run -t --name go-echo -p 8080:8080 go-echo

curl-host:
	curl -XGET $(shell docker-machine ip):8080/hello

curl-docker:
	docker run -t --rm --link go-echo:go-echo appropriate/curl go-echo:8080/hello
