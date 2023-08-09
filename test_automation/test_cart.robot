*** Settings ***
Documentation           A test suite for cart funcionality check
Resource                Helpers.robot
Library                 SeleniumLibrary
Variables               variables.py
Variables               locators.py

Test Setup              Open Browser                ${BASIC_URL}        ${BROWSER_TYPE}
Test Teardown           Close All Browsers


*** Test Cases ***
Test Amazon Cart Is Empty By Default
    [Documentation]     This test case checks if the newly created anonymous session has a
    ...                 customer cart empty. The AAA test concept is being used.    
    
    #Arrange - set up the data that need to be checked
    ${empty_cart_message}   Set Variable            Your Amazon Cart is empty
    ${cart_title}           Set Variable            Amazon.com Shopping Cart
    ${target_cart_items_amount}                     Set Variable        0
    
    # Act - perform needed actions
    Open Amazon Cart    
    ${found_message}        Get Text                ${EMPTY_CART_MESSAGE_LOCATOR}

    # Assert - check if the target data and the found data are the same
    Title Should Be         ${cart_title}
    Should Be Equal         ${found_message}        ${empty_cart_message}
    Check Cart Items Counter Value                  ${target_cart_items_amount}  


Test Amazon Goods Can Be Sorted And Added To Cart
    [Documentation]     This test case checks if the Amazon goods can be selected via the
    ...                 "search" field, then sorted decreasingly, and two most expensive
    ...                 Amazon goods can be added to cart.  

    # arrange
    ${confirmation_message}     Set Variable        Added to Cart
    ${target_cart_items}        Set Variable        2

    #act
    Find Amazon Target Category                 ${CATEGORY_NAME}
    Sort Amazon Target Category                 ${PRICE_DECREASING_BUTTON_LOCATOR}
    ${first_item}               Get Amazon Goods    0
    Click Element               ${first_item}
    Put Amazon Goods To Cart
    Element Should Contain      ${ADDED_TO_CART_LOCATOR}        ${confirmation_message}

    Find Amazon Target Category                 ${CATEGORY_NAME}
    Sort Amazon Target Category                 ${PRICE_DECREASING_BUTTON_LOCATOR}
    ${second_item}              Get Amazon Goods    1
    Click Element               ${second_item}
    Put Amazon Goods To Cart
    Element Should Contain      ${ADDED_TO_CART_LOCATOR}        ${confirmation_message}

    Open Amazon Cart
    ${cart_items_counter}       Get Text                        ${CART_ITEMS_LOCATOR}

    # assert
    Check Cart Items Counter Value                              ${target_cart_items}
