default: clean dependencies test build

.PHONY: build
build:
	./gradlew buildZip

.PHONY: dependencies
dependencies:
	npm list -g serverless || npm install -g serverless

.PHONY: clean
clean:
	./gradlew clean

.PHONY: deploy
deploy:
	sls deploy --verbose -s $(ENVIRONMENT)

.PHONY: delete
delete:
	sls remove --verbose -s $(ENVIRONMENT)

.PHONY: test
test:
	./gradlew test

.PHONY: test-stack
test-stack:
	sls deploy --noDeploy