*** Settings ***
Library    Selenium2Library
Resource    ../Properties.robot
Resource    ../Keyword/Common_Keyword.robot

*** Keywords ***
Click add single user
    click element               xpath=//I[@class='material-icons'][text()='add']
    sleep   5s
    click element               xpath=//I[@class='material-icons'][text()='person_add']
    location should contain     ${url}/users/create

Click upload multiple user
    click element               xpath=//I[@class='material-icons'][text()='add']
    sleep   5s
    click element               xpath=(//I[@class='material-icons'][text()='group'])[2]
    page should contain         Mass User Upload

Click add button
    click link       ADD
    choose file      xpath=(//INPUT[@type='file'])[1]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/add_template.csv
    sleep   5s

Click update button
    click element   xpath=//A[@class='btn btn-default btn-tab btn-update'][text()='UPDATE']
    choose file      xpath=(//INPUT[@type='file'])[2]   /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/update_template.csv
    sleep   5s

Click delete button
    click element   xpath=//A[@class='btn btn-default btn-tab btn-delete'][text()='DELETE']
    choose file      xpath=(//INPUT[@type='file'])[3]   /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/delete_template.csv
    sleep   5s

Click upload to add button
    click element                   xpath=//BUTTON[@type='button'][text()='Upload to add']
    page should contain             File successfully uploaded


Click upload to update button
    click element                   xpath=//BUTTON[@type='button'][text()='Upload to update']

Click upload to delete button
    click element                   xpath=//BUTTON[@type='button'][text()='Upload to delete']

Click x button
    click element                   xpath=//SPAN[@aria-hidden='true'][text()='×']

Click create change button
    click element                   xpath=//SPAN[@class='text'][text()='Create Changes']

Click edit
    [Arguments]  ${firstName}
    click link                       Edit ${firstName}
#    page should contain element     xpath=//LI[text()='Management'])/LI[text()='Users'])/LI[@class='active'][text()='Edit']

Click update password button
    click element                   xpath=//SPAN[@class='text'][text()='Update Password']

Click save change button
    click element                   xpath=//SPAN[@class='text'][text()='Save Changes']
#    page should contain element     xpath=//LI[text()='Management'])/LI[text()='Users'])/LI[@class='active'][text()='${firstName} ${lastName}']

Click delete user button
    click element                   xpath=//SPAN[@class='hidden-sm hidden-xs'][text()='Delete ${firstName}']
    alert should be present         Are you sure you want to delete ${firstName} ${lastName}?
    choose ok on next confirmation

Choose user to edit information
    [Arguments]  ${firstName}    ${lastName}
    click link      ${firstName} ${lastName}
    page should not contain  MANAGEMENT / USERS / ${firstName} ${lastName}

Input all user information
    input text      firstname   ${firstName}
    input text      lastname    ${lastName}
    input text      username    ${createUsername}
    input text      password    ${createPassword}

Input edit user information
    input text      email       ${email}

Update password
    input password  password    newPassword

Upload profile picture and cover picture
    choose file                     xpath=(//INPUT[@type='file'])[1]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/burger.png
    page should contain element     xpath=//DIV[@class='wrap-profile-circle']/DIV[@class='radial-progress']/DIV[@class='inset']/DIV[@class='percentage']
    choose file                     xpath=(//INPUT[@type='file'])[2]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/sky.jpg
    page should contain element     xpath=//DIV[@class='wrap-fileupload cover-upload']/DIV[@class='radial-progress']/DIV[@class='inset']/DIV[@class='percentage']

Check deleted user is not shows in search result
    [Arguments]  ${firstName}
    input text                      xpath=//INPUT[@class='search-input type-search-input tt-input']    ${firstName}
    sleep   5s
    page should contain element     xpath=//DIV[@class='media result-list empty-message'][text()='Your search turned up 0 results. This most likely means the backend is down, yikes!']

Check after upload file update user
    textfield should contain        xpath=//INPUT[@id='email']          banana1@ekoapp.com

Set user to administrator
    select from list                xpath=//SELECT[@name='userType']    Administrator
