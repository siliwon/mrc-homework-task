*** Settings ***
Documentation           This resource file provides the basic methods which allow 
...                     to interact with webpages and their elements. 
...                     Methods can be reused in future.
Library                 SeleniumLibrary
Variables               variables.py
Variables               locators.py

*** Keywords ***
Open Amazon Cart
    Go To               ${BASIC_URL}${CART_URL}
    Wait Until Page Contains Element        ${CART_LOCATOR}             ${timeout}  

Find Amazon Target Category
    [Arguments]         ${category_name}
    Go To               ${BASIC_URL}
    Wait Until Page Contains Element        ${SEARCH_FIELD_LOCATOR}     ${timeout}    
    Input Text          ${SEARCH_FIELD_LOCATOR}                         ${category_name}
    Click Button        ${SEARCH_BUTTON_LOCATOR}


Sort Amazon Target Category
    [Arguments]         ${sorting_option}
    Wait Until Page Contains Element        ${SORTING_BUTTON_LOCATOR}   ${timeout}
    Click Element       ${SORTING_BUTTON_LOCATOR}
    Wait Until Page Contains Element        ${sorting_option}           ${timeout}
    Click Element       ${sorting_option}

Get Amazon Goods
    [Arguments]         ${position}
    Wait Until Page Contains Element        ${FOUND_ELEMENTS_LOCATOR}   ${timeout}
    ${FOUND_ITEMS}      Get Web Elements    ${FOUND_ELEMENTS_LOCATOR}
    [Return]            ${FOUND_ITEMS[${position}]}

Put Amazon Goods To Cart
    Wait Until Element Is Visible           ${ADD_TO_CART_LOCATOR}      ${timeout}
    Click Element       ${ADD_TO_CART_LOCATOR}

Check Cart Items Counter Value
    [Arguments]         ${target_value}
    Wait Until Page Contains Element        ${CART_ITEMS_LOCATOR}       ${timeout}
    ${cart_items_counter}       Get Text    ${CART_ITEMS_LOCATOR}
    Should Be Equal             ${cart_items_counter}                   ${target_value}
