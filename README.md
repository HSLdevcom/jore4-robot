# JORE4 end-to-end tests

Tests are implemented using Robot Framework, with Browser library for front-end functionalities.

### How to run tests locally

To set up the environment variables for running the tests, create your local copy of `.env` file: `cp .env-template .env` and fill in the details:
- the e2e user credentials can be found from the JORE4 Azure `hsl-jore4-vault` key-vault. The secrets are called `ROBOT_HSLID_EMAIL` and `ROBOT_HSLID_PASSWORD`

Start up all the microservices using `start_env.sh`. This downloads the latest working set of microservices. If you wish to override some versions or environment variables, you can do so within `docker-compose.override.yml` (See commented examples)

Tests can be run on local machine with `run_tests.sh` script. Running it requires that you have docker installed on your computer, since the tests are run in a docker container. You also need to edit the placeholder variables for username and password in the `run_tests.sh`file, these can be found from the hsl-jore4-common key-vault as secrets.
In addition the script takes three parameters:

1. environment you want to test against
   1. `localhost` for Linux localhost environment (where UI is running on `http://localhost:3300`)
   2. `localmac` for MacOS localhost environment (where UI is running on `http://localhost:3300`)
   3. `dev` for running against `dev.jore.hsl.fi`
   4. `test` for running against `test.jore.hsl.fi`
2. Browser you want to test with (possible browsers `chromium`, `firefox`, `webkit`)
3. (optional) the tag of the tests that should be run (`"*"`, `smoke`)

Examples:
- `sh run_tests.sh localmac chromium`
- `sh run_tests.sh localhost chromium`
- `sh run_tests.sh dev webkit`
- `sh run_tests.sh localhost firefox "*"`
- `sh run_tests.sh localhost webkit smoke`

Test results are located in tests/output folder after the tests are done.

In some environments you may get an error about the test run not having enough rights to the `tests` directory. The simplest solution to this is to allow global r/w access to that directory:
```
	chmod a+rw tests
```

### Developing new tests

When creating new files:

- New keyword files should be added to list in `tests/Keywords/Keywords.robot file`
- New variable or resource files should be added to list in `tests/Resources/Resources.robot` file

All variables, resources and keywords are imported to tests in `tests/TestCases/TestResources.robot` file in `tests/TestCases` folder.

Naming conventions in .robot files:

- all lower case letters (e.g. "user logs in with hslid"), custom created Robot Framework keyword.
- each word starting with capital letter (e.g. "Take Screenshot"), Robot Framework keyword provided by external library.
- first word starting with capital letter (e.g. "Remove spaces"), python function.

### How to run tests from a github action or workflow

Add this to your repositorys workflow file.

```yaml
jobs:
  run_e2e_tests:
    runs-on: ubuntu-20.04
    steps:
      - name: start e2e env
        uses: HSLdevcom/jore4-flux/github-actions/setup-e2e-environment@setup-e2e-environment-v1

      - name: run e2e smoke tests
        id: tests
        uses: HSLdevcom/jore4-robot/github-actions/run-rf-tests@actions-v1
        with:
          test_env: #'localhost'(default), 'test' or 'dev' (localhost is used in github pipelines, since the service is running in localhost address. Test and dev are used for test/dev.jore.hsl.fi)
          browser: #'chromium'(default), 'firefox', 'webkit'
          included_tag: #if you want to add specific tag for which tests to run
          test_suite_version: #which docker image to use, e.g. 'hsldevcom/jore4-robot:latest'
          e2e_username: ${{ secrets.ROBOT_HSLID_EMAIL }}
          e2e_password: ${{ secrets.ROBOT_HSLID_PASSWORD }}

      - name: upload test results
        if: always()
        uses: HSLdevcom/jore4-robot/github-actions/upload-results@actions-v1
```

To add e2e tests to repository's pipeline. Copy this template and add it to end of your repositorys workflow file. The docker-compose environment is started with setup-e2e-environment action, instructions for its usage can be found [here](https://github.com/HSLdevcom/jore4-flux#docker-compose). After the tests are completed the results are published as artifacts, which can be found in the summary page of the workflow execution.

Inputs for `test_env`, `browser` and `included_tag` can be left off, if you want to use the default values. `e2e_username` and `e2e_password` are needed and they are saved as secrets in each jore4 repository, if you need to update or change them, instructions for it can be found [here](https://github.com/HSLdevcom/jore4-tools#add_secretspy).
