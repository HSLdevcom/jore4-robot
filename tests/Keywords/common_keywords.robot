*** Keywords ***
clear text in element
    [Arguments]   ${locator}
    ${value}    Get Element Attribute   ${locator}    value
    ${backspace_count}    Get Length    ${value}
    Run Keyword If    """${value}""" != ''    Repeat Keyword  ${backspace_count + 1}  Press Keys  ${locator}   BACKSPACE

scroll element to view
    [Arguments]   ${element}
    Execute JavaScript    window.document.evaluate("${element}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
