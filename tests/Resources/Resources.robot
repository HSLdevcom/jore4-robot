*** Settings ***
#When adding variables from new python files add them here as Variables
Variables     ./EnvironmentVariables/common_environment_variables.py
Variables     ./EnvironmentVariables/${ENV}_environment_variables.py
Variables     ../Libraries/common_functions.py
#When adding new robot variable files add them here as Resources
Resource      ./xpaths.robot
Resource      ./routes_and_lines_locators.robot
Resource      ./login_locators.robot
