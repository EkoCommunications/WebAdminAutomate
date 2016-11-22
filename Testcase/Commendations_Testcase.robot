*** Settings ***
Library    Selenium2Library
Resource   ../Keyword/Commendations_Keyword.robot
Resource  ../Keyword/Common_Keyword.robot
Resource  ../Properties.robot

*** Test Cases ***
#Add commendations
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click commendations menu
#    ${commendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
#    Log     ${commendationCount}
#    Click add more commendation
#    upload commendation photo
#    Input commendation name    ${commendationName}
#    Input commendation color   \#ff91a6
#    Click save button
#    ${newCommendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
#    run keyword if  ${newCommendationCount} != ${commendationCount}+1    fail    msg='Commendation doesn't added'
#    [teardown]  close browser

#Edit commendations name
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click commendations menu
#    Click edit button
#    Input new commendation name  ${commendationRenamename}
#    [teardown]  close browser

#Edit commendations color
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click commendations menu
#    Click edit button
##    Clear commendation color on text field
#    Input new commendation color  \#9FBF00
##    Click save button (still error need to click on last save button)
#    [teardown]  close browser

#Delete commendations
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click commendations menu
#    Delete commendation
#    [teardown]  close browser

#Add reward
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click rewards menu
#    ${rewardCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
#    ${rewardCount}=    evaluate  ${rewardCount} + 1
#    Log     ${rewardCount}
#    Click add rewards button
#    Upload reward photo
#    Input reward name   Automate_Reward     ${rewardCount}
#    Input reward description                ${rewardCount}
#    Input reward point     10               ${rewardCount}
#    Input redeem message                    ${rewardCount}
#    Click save reward button                ${rewardCount}
#    ${newRewardCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
#    run keyword if  ${newRewardCount} != ${rewardCount}    fail    msg='Reward doesn't added'
#    [teardown]  close browser
#
#Edit reward
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click rewards menu
#    ${rewardCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
#    Log     ${rewardCount}
#    Click edit button
#    Input reward name   Automate_Reward_Edit    ${rewardCount}
#    Input reward point      20                  ${rewardCount}
#    Click save reward button                    ${rewardCount}
#    [teardown]  close browser

#Remove reward
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click rewards menu
#    Delete reward
#    [teardown]  close browser

#Search user point
#    Login web admin     ${mainUsername}    ${mainPassword}
#    Click points menu
#    search user point   ${mainUsername}
#    [teardown]  close browser

Give user point
    Login web admin     ${mainUsername}    ${mainPassword}
    Click points menu
    Search user point   ${mainUsername}
    ${currentUserPoint}=    get text       xpath=//TD[@class='text-right']
    ${addUserPoint}=    convert to integer  5
    Give user point     ${addUserPoint}
    ${expectUserPoint}=     evaluate  ${currentUserPoint} + ${addUserPoint}
    ${newUserPoint}=    get text    xpath=//TD[@class='text-right']
    run keyword if  ${newUserPoint} != ${expectUserPoint}   fail
    [teardown]  close browser


[teardown]  Close Browser