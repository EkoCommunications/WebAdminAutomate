*** Settings ***
Library    Selenium2Library
Resource   ../Keyword/Broadcast_Keyword.robot
Resource  ../Keyword/Common_Keyword.robot

*** Test Cases ***
#Create new broadcast group
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Create broadcast group
#    Enter group name    ${groupbroadcastname}
#    Add user    ${broadcastUser1}    ${broadcastUser2}    ${broadcastUser3}
#    Click save button
#    [Teardown]  close browser

#Click to broadcast group
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Click on group name    ${groupbroadcastname}
#    [Teardown]  close browser
#
#Send broadcast text
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Type broadcast message
#    Click send button
#    Click broadcast menu
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [Teardown]  close browser
#
#Send broadcast sticker
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Click sticker button
#    Choose sticker
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [Teardown]  close browser
#
#Send broadcast picture
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#     ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose image file
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser
#
#Send broadcast video time<3min and size<200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose video file    <3min and <200MB.mp4
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser

#Send broadcast video time<3min and size=200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose video file    <3min and =200MB.mp4
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser
#
#Send broadcast video time<3min and size>200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose large video file    <3min and >200MB.mp4
#    Video size more than 200MB shows warning message
#    [teardown]  Close Browser
#
#Send broadcast video time=3min and size<200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose video file    =3min and <200MB.mp4
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser
#
#Send broadcast video time=3min and size>200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose large video file    =3min and >200MB.mp4
#    Video size more than 200MB shows warning message
#    [teardown]  Close Browser
#
#Send broadcast video time>3min and size<200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose video file    >3min and <200MB.mp4
#    Broadcast preview should be    1
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser
#
#Send broadcast video time>3min and size>200MB
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Choose large video file    >3min and >200MB.mp4
#    Video size more than 200MB shows warning message
#    [teardown]  Close Browser

#Send text sticker picture and video
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Click create new broadcast button
#    Type broadcast message
#    Choose image file
#    Choose video file    <3min and <200MB.mp4
#    Click sticker button
#    Choose sticker
#    Broadcast preview should be    3
#    Click send button
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}+3      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser

#Remove broadcast message
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${messageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${messageCount}
#    Click on group name    ${groupbroadcastname}
#    Remove broadcast message
#    Click broadcast menu
#    ${newMessageCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[2]
#    Log     ${newMessageCount}
#    run keyword if       ${newMessageCount} != ${messageCount}-1      fail    msg='WebAdmin display wrong number of messages'
#    [teardown]  Close Browser

#Add more user to broadcast group
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${memberCount}=    get text     xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${memberCount}
#    Click on group name    ${groupbroadcastname}
#    Add user    ${addBroadcastUser1}    ${addBroadcastUser2}    ${addBroadcastUser3}
#    Click add members button
#    Click broadcast menu
#    ${newMemberCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${newMemberCount}
#    run keyword if       ${newMemberCount} != ${memberCount}+3      fail    msg='WebAdmin display wrong number of members'
#    [teardown]  Close Browser

#Remove user from broadcast group
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${memberCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${memberCount}
#    Click on group name    ${groupbroadcastname}
#    Select users to removed
#    Click remove selected users button
#    Click broadcast menu
#    ${newMemberCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${newMemberCount}
#    run keyword if       ${newMemberCount} != ${memberCount}-1      fail    msg='WebAdmin display wrong number of members'
#    [teardown]  Close Browser
#
#Remove user from broadcast group by select all users
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    ${memberCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${memberCount}
#    Click on group name    ${groupbroadcastname}
#    Select all users
#    Click remove selected users button
#    Click broadcast menu
#    ${newMemberCount}=    get text   xpath=(//LI/DIV/A[text()='${groupBroadcastName}']/../..//DIV[@class='eko-col col-xs-2 text-right'])[1]
#    Log     ${newMemberCount}
#    pass execution if   ${newMemberCount} == 0    msg='All users in group has been deleted'
#    [teardown]  Close Browser

#Delete broadcast group from inside
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Create broadcast group
#    Click on group name  ${groupBroadcastName}
#    Delete broadcast group
#    Click broadcast menu
#    Broadcast page shouldn't displayed deleted broadcast group
#    [teardown]  close browser

#Delete broadcast group from broadcast page
#    Login web admin    ${mainUsername}    ${mainPassword}
#    Click broadcast menu
#    Create broadcast group
#    Enter group name    ${groupBroadcastForDelete}
#    Add user    ${broadcastUser1}    ${broadcastUser2}    ${broadcastUser3}
#    Click save button
#    Select broadcast group  ${groupBroadcastForDelete}
#    Click remove selected groups
#    Click broadcast menu
#    Broadcast page shouldn't displayed deleted broadcast group
#    [teardown]  close browser

[teardown]  Close Browser