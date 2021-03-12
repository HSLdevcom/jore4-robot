# INSTRUCTIONS #
# FOLDER LAYOUT
This is a template for new robot framework projects.<br/>
It contains all the required basic files to start creating new tests.<br/>
When creating new files:  
- Keyword files should be added to Keywords.robot file in keywords folder<br/>
- Variable/Resource files should be added to Resources.robot file in Resources folder<br/>
All variables/resources and keywords are imported to tests in TestResources.robot file in
TestCases folder.

# HOW TO RUN TESTS
To run tests you need to have docker installed.
Then run "run_tests.sh" script in terminal, the script takes in two parameters
that can be used to specify the browser and tags for tests.
example:
# sh run_tests.sh chrome "-i smoke" #
This would run tests tagged with 'smoke' in chrome.

# sh run_tests.sh firefox #
This would run all tests in firefox.

# sh run_tests.sh chrome "-i smoke -e broken" #
This would run tests tagged as 'smoke' that don't have the tag 'broken' in chrome.

Test results are located at results folder in the root of the repository.