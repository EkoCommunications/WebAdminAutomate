*** Settings ***
Library    Selenium2Library
Resource  ../Properties.robot

*** Keywords ***
Login web admin
    [Arguments]  ${USERNAME}    ${PASSWORD}
    Open Browser        ${URL}    ${BROWSER}
    set window size     1000       800
    set selenium speed  0.5s
    Input Text          username        ${USERNAME}
    Input Password      password        ${PASSWORD}
    click Button        submit

Logout web admin
    click element       xpath=//I[@class='material-icons'][text()='settings']
    click element       xpath=//A[@href='/logout']
    choose ok on next confirmation
    get alert message   hooo
    close browser

Click broadcast menu
    click element               xpath=//A[@href='/broadcast']
    location should contain     ${URL}/broadcast

Click users menu
    click element               xpath=//A[@href='/users']
    location should contain     ${URL}/users

Click create user menu
    click element               xpath=//A[@href='/users/create'][text()='Create User']
    location should contain     ${URL}/users/create

Click company profile menu
    click element               xpath=//A[@href='/company']
    location should contain     ${URL}/company

Click chats and workspaces menu
    click element               xpath=//A[@href='/workspaces']
    location should contain     ${URL}/workspaces

Click community menu
    click element               xpath=//A[@href='/community']
    location should contain     ${URL}/community

Click hub menu
    click element               xpath=//A[@href='/hubs']
    location should contain     ${URL}/hubs

Click forms menu
    click element               menu-form
    location should contain     ${URL}/forms
Click create form menu
    click element               xpath=//A[@href='/forms/create'][text()='Create Form']
    location should contain     ${URL}/forms/create

Click form log menu
    click element               xpath=//A[@href='/forms-log'][text()='Forms log']
    location should contain     ${URL}/forms-log

Click commendations menu
    click element               xpath=//A[@href='/commendations']
    location should contain     ${URL}/commendations

Click rewards menu
    click element               xpath=//A[@href='/commendations/rewards'][text()='Rewards']
    location should contain     ${URL}/commendations/rewards

Click points menu
    click element               xpath=//A[@href='/commendations/points?order=fullName&dir=1'][text()='Points']
    location should contain     ${URL}/commendations/points?order=fullName&dir=1

Click sticker packs menu
    click element               xpath=//A[@href='/sticker-packs']
    location should contain     ${URL}/sticker-packs

Click permissions menu
    click element               xpath=//A[@href='/permissions']
    location should contain     ${URL}/permissions

Click email customization menu
    click element               xpath=//A[@href='/email-customization']
    location should contain     ${URL}/email-customization

Click save button
    click element               xpath = //*[text()='Save']

Search user chat and workspaces on search bar
    [Arguments]  ${search}
    input text                 xpath=//INPUT[@class='search-input type-search-input tt-input']    ${search}
    sleep                       5s
    click element               xpath=(//DIV[@class='media result-list type-search-suggestion type-search-selectable'])[1]