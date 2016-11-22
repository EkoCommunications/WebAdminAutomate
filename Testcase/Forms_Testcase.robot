*** Settings ***
Library    Selenium2Library
Resource  ../Keyword/Common_Keyword.robot

*** Test Cases ***
Check the number of template form
    Login web admin
    Click forms menu


Create form menu
    Login web admin
    Click forms menu


    Logout web admin

[teardown]  Close Browser