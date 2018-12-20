SRC_LOCATION=

default: clean dependencies test build

build:

.PHONY: dependencies
dependencies:
	sudo npm list -g serverless || sudo npm install -g serverless

.PHONY: clean
clean:
	rm -rf ./bin ./vendor Gopkg.lock

.PHONY: deploy
deploy:
	sls deploy --verbose -s $(ENVIRONMENT)

.PHONY: delete
delete:
	sls remove --verbose -s $(ENVIRONMENT)


test: test-all

.PHONY: test-all
test-all:
	@go test -v -cover ./$(SRC_LOCATION)/...

.PHONY: test-stack
test-stack:
	sls deploy --noDeploy

.PHONY: test-min
test-min:
	@go test ./...

.PHONY: integ
integ:
	./setup.sh $(STACK_NAME) $(COLLECTION) &&
	./run.sh $(COLLECTION)