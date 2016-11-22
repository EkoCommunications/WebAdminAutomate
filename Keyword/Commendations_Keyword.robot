*** Settings ***
Library    Selenium2Library
Resource    ../Properties.robot
Resource    ../Keyword/Common_Keyword.robot


*** Keywords ***

Click add more commendation
    click element    xpath=//I[@class='material-icons'][text()='add_circle_outline']

Click save reward button
    [Arguments]     ${rewardCount}
    click element   xpath=(//BUTTON[@class='btn btn-secondary'][text()='Save'])[${rewardCount}]

Click edit button
    ${commendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
    Log     ${commendationCount}
    click element   xpath=(//I[@class='material-icons'][text()='edit'])[${commendationCount}]

Click add rewards button
    click element   xpath=//DIV[@class='mask-area']

Upload commendation photo
    choose file     xpath=(//INPUT[@type='file'])[1]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/burger.png

Upload reward photo
    choose file     xpath=(//INPUT[@type='file'])[1]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/christmasgiftbox.jpeg

Input commendation name
    [Arguments]     ${commendationName}
    input text      xpath=(//INPUT[@type='text'])[3]    ${commendationName}

Input commendation color
    [Arguments]     ${colorCode}
    input text      xpath=(//INPUT[@class='hex-value'])[1]  ${colorCode}

Input new commendation name
    [Arguments]     ${newCommendationName}
    ${CommendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
    Log     ${CommendationCount}
    input text       xpath=(//INPUT[@name='name'])[${CommendationCount}+1]    ${newCommendationName}

#    Click save button[12]
    click element    xpath=(//SPAN[@class='label-text'][text()='Save'])[${CommendationCount}+1]

Input new commendation color
    [Arguments]     ${newCommendationColor}
    ${CommendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])\
    Log     ${CommendationCount}
    click element   xpath=(//DIV[@class='input-wrapper']/DIV[@class='color-label']/INPUT[@type='text'])[${commendationCount}]
    input text      xpath=(//DIV[@class='input-wrapper']/DIV[@class='color-label']/INPUT[@type='text'])[${commendationCount}]     ${newCommendationColor}

Input reward name
    [Arguments]     ${rewardName}   ${rewardCount}
    input text      xpath=(//INPUT[@name='name'])[${rewardCount}]    ${rewardName}

Input reward description
    [Arguments]     ${rewardCount}
    input text      xpath=(//TEXTAREA[@name='description'])[${rewardCount}]   If the deeds and presence of one character can be merged into another then that first character isn’t necessary.

Input reward point
    [Arguments]     ${rewardPoint}  ${rewardCount}
    input text      xpath=(//INPUT[@name='pointCost'])[${rewardCount}]        ${rewardPoint}

Input redeem message
    [Arguments]     ${rewardCount}
    input text      xpath=(//TEXTAREA[@name='condition'])[${rewardCount}]      This is especially true of characters who are there to serve plot points. A character who is present just so their death can establish a villain’s credentials is likely to read as a one-dimensional tool (just ask Star Trek’s Redshirts.)

Clear commendation color on text field
    ${commendationCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
    Log     ${commendationCount}
    clear element text      xpath=(//INPUT[@type='text'])[37]
#    clear element text     xpath=//DIV[@class='color-picker-wrapper']/INPUT[@name='name'][@value='Test_Rename']/DIV[@class='color-label']/INPUT[@type='text'][@value='#ff91a6']

Delete commendation
    ${deleteIconCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='delete'])
    Log     ${deleteIconCount}
    click element               xpath=(//I[@class='material-icons'][text()='delete'])[${deleteiconCount}]
    alert should be present     Are you sure you want to delete ${commendationRenamename}?
    choose ok on next confirmation

Delete reward
    ${rewardCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
    Log     ${rewardCount}
    select checkbox     xpath=(//INPUT[@type='checkbox'])[${rewardCount}*2]
    click element       xpath=//SPAN[@class='label-text'][text()='Remove selected item']
    alert should be present  Are you sure you want to delete selected rewards?
    choose ok on next confirmation
    ${newRewardCount}=    Get matching xpath count   xpath=(//I[@class='material-icons'][text()='edit'])
    run keyword if  ${newRewardCount} != ${rewardCount}-1    fail    msg='Reward doesn't deleted'

Search user point
    [Arguments]     ${user}
    input text      xpath=//INPUT[@name='search']    ${user}
    click element   xpath=(//BUTTON[@class='btn btn-xs btn-secondary'])[2]


Give user point
    [Arguments]  ${point}
    click element   xpath=//I[@class='material-icons icon-row-edit pull-right'][text()='edit']
    input text      xpath=//INPUT[@name='point']    ${point}
    click save button
