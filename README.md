# INSTRUCTIONS #
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
