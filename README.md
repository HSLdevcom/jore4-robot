# INSTRUCTIONS

## Adding e2e tests to pipeline

To add e2e tests to repositorys pipeline. Copy the code from workflow_template.yml and add it to end of your repositorys workflow file.
Template contains steps for creating empty folder for test results, calling the action that builds the kubernetes environment and runs tests and then publishing the results as artifacts after tests are run. The artifacts can be found in the summary page of the workflow execution.

### Action file

The action inside this repository can be used anywhere and it builds the environment locally, based on given parameters. And then executes selected robot tests against it.
It can be given specific versions of docker images, browser to be used and tags for tests to be run as input.

```
inputs:
  front_end_version:
    description: version of ui to use
    required: false
    default: "latest"
  test_env:
    description: test environment name to select correct robot framework env variables. (test or localhost)
    required: false
    default: "localhost"
  browser:
    description: browser for running tests
    required: false
    default: "chromium"
  included_tag:
    description: Tag for which tests to run
    required: false
    default: "smoke"
```

# FOLDER LAYOUT

When creating new files:

- Keyword files should be added to Keywords.robot file in keywords folder<br/>
- Variable/Resource files should be added to Resources.robot file in Resources folder<br/>
  All variables/resources and keywords are imported to tests in TestResources.robot file in
  TestCases folder.

# HOW TO RUN TESTS

Tests can be run locally with run_tests.sh script.
It takes two parameters, that are used as variables in robot files.

1. environment you want to test against
2. Browser you want to test with (possible browsers chromium, firefox, webkit)

f. ex. "sh run_tests.sh test chromium"

Test results are located at results folder in the root of the repository.
