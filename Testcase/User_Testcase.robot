*** Settings ***
Library    Selenium2Library
Resource  ../Keyword/Common_Keyword.robot
Resource   ../Keyword/User_Keyword.robot
Library    Selenium2Library

*** Test Cases ***
Add single user
    Login web admin    ${mainUsername}    ${mainPassword}
    Click users menu
    Click add single user
    Input all user information
    Upload profile picture and cover picture
    Click create change button
    [Teardown]  close browser

Create user
    Login web admin    ${mainUsername}    ${mainPassword}
    Click create user menu
    Input all user information
#    Upload profile picture and cover picture
    Click create change button
    [Teardown]  close browser

Edit user
    Login web admin    ${mainUsername}    ${mainPassword}
    Search user chat and workspaces on search bar    ${firstName}
    Click edit    ${firstname}
    Input edit user information
    Click save change button
    [Teardown]  close browser

Edit user by update password
    Login web admin    ${mainUsername}    ${mainPassword}
    Search user chat and workspaces on search bar    ${firstName}
    Click edit    ${firstname}
    Update password
    Click update password button
    [teardown]  close browser

Delete single user
    Login web admin    ${mainUsername}    ${mainPassword}
    Search user chat and workspaces on search bar    ${firstName}
    Click delete user button
    Check deleted user is not shows in search result    ${firstname}
    [teardown]  Close Browser

Set user to administrator
    Login web admin    ${mainUsername}    ${mainPassword}
    Click users menu
    Click add single user
    Input all user information
    Click create change button
    Search user chat and workspaces on search bar    ${firstName}
    Click edit    ${firstname}
    Set user to administrator
    Click save change button
    Logout web admin
    Login web admin  ${createUsername}    ${createPassword}
    [teardown]  Close Browser

Add users by upload multiple users
    Login web admin    ${mainUsername}    ${mainPassword}
    Click users menu
    Click upload multiple user
    Click add button
    Click upload to add button
    Click x button
    Search user chat and workspaces on search bar      banana1
    [teardown]  Close Browser

Update users by upload multiple users
    Login web admin    ${mainUsername}    ${mainPassword}
    Click users menu
    Click upload multiple user
    Click update button
    Click upload to update button
    Click x button
    Search user chat and workspaces on search bar      banana1
    Click edit  banana1
    Check after upload file update user
    [teardown]  Close Browser

Delete users by upload multiple users
    Login web admin    ${mainUsername}    ${mainPassword}
    Click users menu
    Click upload multiple user
    Click delete button
    Click upload to delete button
    Click x button
    Check deleted user is not shows in search result    banana2
    [teardown]  Close Browser

[teardown]  Close Browser