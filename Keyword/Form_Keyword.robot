*** Settings ***
Library    Selenium2Library
Resource  ../Properties.robot


*** Keywords ***
Click more template
    click element       xpath=//SPAN[@class='default-label'][text()='More Template']

Count

Enter group name
    input text          name=name    ${groupBroadcastName}

Add user
    @{ITEMS}    CREATE LIST     ${broadcastUser1}   ${broadcastUser2}   ${broadcastUser3}
    : FOR   ${ELEMENT}  IN  @{ITEMS}
    \   input text          xpath=//INPUT[@class='users-search-input users-type-search-input tt-input']    ${ELEMENT}
    \   sleep  5s
    \   click element       xpath=//DIV[@class='media result-list users-type-search-suggestion users-type-search-selectable']

Click save button
    click button       xpath=//BUTTON[@class='btn btn-secondary btn-save'][text()='Save']

Select first broadcast group
    select checkbox    xpath=(//INPUT[@type='checkbox'])[2]

Delete broadcast group
    click element       xpath=//I[@class='material-icons text-danger'][text()='delete']
    get alert message   Are you sure you want to logout?
    choose ok on next confirmation
