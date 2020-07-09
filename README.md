# serverless-java-boilerplate
Boilerplate for using Java and Serverless framework

## Commands

The Makefile contains the various commands required to clean, build, test, and deploy the application

**Clean:**
The clean command will clean up the gradle dependencies produced from the build
```bash
    make clean 
```
**Build:**
The build command will package the java into a zip file to be uploaded to lamabd
```bash
    make build
```

**Test:**
The test command execute all junit tests in the project
```bash
    make test
```

**Deploy:**
The deploy command will deploy the application to aws lambda.  It requires an environment variable to be passed in that represents the name of the environment to deploy to (dev, stage, prod, etc) 
```bash
    make deploy ENVIRONMENT=${YOUR_ENVIRONMENT}
```