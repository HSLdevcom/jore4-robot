# INSTRUCTIONS

## Adding e2e tests to pipeline

Add this to your repositorys cd workflow

```
jobs:
  run_e2e_tests:
    runs-on: ubuntu-20.04
    steps:
      - name: make folder for reports
        run: mkdir reports

      - name: run e2e smoke tests
        id: tests
        uses: HSLdevcom/jore4-robot/.github/action@main
        with:
          test_env: #localhost, test or dev (localhost is used in github pipelines, since the service is running in localhost address. Test and dev are used for test/dev.jore.hsl.fi)
          browser: #chromium, firefox, webkit
          test_tag: #if you want to add specific tag for which tests to run
          frontend_version: #which docker image to use, e.g. hsldevcom/jore-ui:latest
          backend_version: #which docker image to use, e.g. hsldevcom/jore-backend:latest

      - name: Retrieve test results from docker container
        run: docker cp robot-tests:/tests/output/. ${{ github.workspace }}/reports/

      - name: Expose test results as an artifact
        uses: actions/upload-artifact@v1
        with:
          name: reports
          path: ${{ github.workspace }}/reports
```

To add e2e tests to repository's pipeline. Copy this template and add it to end of your repositorys workflow file.
Template contains steps for creating empty folder for test results, calling the action that builds the kubernetes environment and runs tests and then publishing the results as artifacts after tests are run. All the "with" variables can be left out and have default values specified inside the action. The artifacts can be found in the summary page of the workflow execution.

## Action file

The action inside this repository can be used anywhere and it builds the environment locally, based on given parameters. And then executes selected robot tests against it.
It can be given specific versions of docker images, browser to be used and tags for tests to be run as input.

# FOLDER LAYOUT

When creating new files:

- Keyword files should be added to Keywords.robot file in keywords folder<br/>
- Variable/Resource files should be added to Resources.robot file in Resources folder<br/>
  All variables/resources and keywords are imported to tests in TestResources.robot file in
  TestCases folder.

# HOW TO RUN TESTS

Tests can be run on local machine with run_tests.sh script.
It takes two parameters, that are used as variables in robot files.

1. environment you want to test against (localhost, if you are running the service on your machine and dev or test for dev/test.jore.hsl.fi)
2. Browser you want to test with (possible browsers chromium, firefox, webkit)

f. ex. "sh run_tests.sh test chromium"

Test results are located at results folder in the root of the repository.
