*** Settings ***
Library    Selenium2Library
Resource    ../Properties.robot



*** Keywords ***
Create broadcast group
    click element       xpath=//SPAN[@class='text'][text()='Create new group']

Enter group name
    [Arguments]  ${groupbroadcastname}
    input text          name=name    ${groupBroadcastName}

Add user
    [Arguments]  ${broadcastuser1}    ${broadcastUser2}    ${broadcastUser3}
    @{ITEMS}    CREATE LIST     ${broadcastUser1}   ${broadcastUser2}   ${broadcastUser3}
    : FOR   ${ELEMENT}  IN  @{ITEMS}
    \   input text          xpath=//INPUT[@class='users-search-input users-type-search-input tt-input']    ${ELEMENT}
    \   sleep  5s
    \   click element       xpath=//DIV[@class='media result-list users-type-search-suggestion users-type-search-selectable']

#Click save button
#    click button       xpath=//BUTTON[@class='btn btn-secondary btn-save'][text()='Save']

Click on group name
    [Arguments]  ${groupbroadcastname}
    click link          ${groupBroadcastName}

Click create new broadcast button
    click element               xpath=(//BUTTON[@type='submit'])[2]
    page should contain         Create broadcast
    location should contain     ${URL}/broadcast/new-broadcast/

Click sticker button
    click element                   xpath=//A[@class='btn btn-message-sticker']
    Page Should Contain Element     xpath=//DIV[@class='broadcast-sticker-wrapper']

Click send button
    click button               Send
    sleep  10s
    page should contain         Broadcast Groups

Click add members button
    ${userBoxCount}=    Get matching xpath count   xpath=(//DIV[@class='box'])
    Log     ${userBoxCount}
    click element       xpath=(//BUTTON[@type='submit'])[3]
    ${expectedBoxCount}=    Get matching xpath count   xpath=(//DIV[@class='box'])
    run keyword if      ${expectedBoxCount} != ${userBoxCount}+3    fail

Click remove selected users button
#    ${userBoxCount}=    Get matching xpath count   xpath=(//DIV[@class='box'])
#    Log     ${userBoxCount}
    click element   //BUTTON[@class='btn btn-remove-item remove-users remove-select-user-handler pull-right']
    alert should be present  Are you sure you want to delete selected user(s)?
    choose ok on next confirmation
#    ${expectedBoxCount}=    Get matching xpath count   xpath=(//DIV[@class='box'])
#    run keyword if      ${expectedBoxCount} != ${userBoxCount}-1    fail    msg='WebAdmin display wrong number of users after removed'


Type broadcast message
    input text      broadcastMessage    ${broadcastMessage}

Choose sticker
    click element           xpath=(//DIV[@class='broadcast-sticker-item col-sm-3 col-xs-4'])[1]

Choose image file
    choose file     xpath=(//INPUT[@type='file'])[1]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/burger.png
    Wait Until Element Is Enabled	xpath=//BUTTON[@class='btn btn-success btn-block btn-lg btn-create-broadcast-submit'][text()='Send']    3m

Choose video file
    [Arguments]     ${videoFile}
    choose file     xpath=(//INPUT[@type='file'])[2]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/HD_Video/${videoFile}
    Wait Until Element Is Enabled	xpath=//BUTTON[@class='btn btn-success btn-block btn-lg btn-create-broadcast-submit'][text()='Send']    15m

Choose large video file
    [Arguments]     ${videoFile}
    choose file     xpath=(//INPUT[@type='file'])[2]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/HD_Video/${videoFile}

Broadcast preview should be
    [Arguments]     ${expectedCount}
    ${count}=    Get matching xpath count   xpath=//A[@class='broadcast-preview-remove btn btn-xs']
    Log     ${expectedCount}
    Log     ${count}
    run keyword if      ${expectedCount} != ${count}    fail    msg='WebAdmin display wrong number broadcast preview'

Video size more than 200MB shows warning message
    page should contain      Video file size is too large.

Remove broadcast message
    click element            xpath=(//INPUT[@type='checkbox'])[2]
    click element            xpath=//SPAN[@class='label-text'][text()='Remove selected broadcasts']
    alert should be present  Are you sure you want to delete selected message(s)?
    choose ok on next confirmation

Select users to removed
    click element                   xpath=(//INPUT[@type='checkbox'])[8]

Select all users
    click button                    select-all-users
    checkbox should be selected     select-all-users

Delete broadcast group
    click link                  Delete ${groupBroadcastForDelete}
    alert should be present     Are you sure you want to delete ${groupBroadcastForDelete}?
    choose ok on next confirmation

Click remove selected groups
    click element               //SPAN[@class='label-text'][text()='Remove selected groups']
    alert should be present     Are you sure you want to delete selected group(s)?
    choose ok on next confirmation

Broadcast page shouldn't displayed deleted broadcast group
    page should not contain link  ${groupBroadcastForDelete}

Select broadcast group
    [Arguments]  ${groupBroadcastName}
    select checkbox                 xpath=(//DIV[@class='eko-col col-xs-1'])/input[@type='checkbox'][@data-groupname='${groupBroadcastName}']
    checkbox should be selected     xpath=(//DIV[@class='eko-col col-xs-1'])/input[@type='checkbox'][@data-groupname='${groupBroadcastName}']