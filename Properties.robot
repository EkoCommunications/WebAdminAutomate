*** Settings ***
Library    Selenium2Library


*** Variables ***
${BROWSER}      chrome
#${BROWSER}      firefox
#${BROWSER}      safari
${URL}    https://ekogreen-admin.ekoapp.com
#${URL}          http://admin.eko01.local

${mainUsername}     nuitest@ekoapp.com
${mainPassword}     password

##########Broadcast##########
${groupBroadcastName}   test1
${groupBroadcastForDelete}    TestDeleteBroadcast

${broadcastUser1}       nui2test
${broadcastUser2}       nui3test
${broadcastUser3}       nuitest

${addBroadcastUser1}    Supitchaya
${addBroadcastUser2}    nuitest5
${addBroadcastUser3}    nuitest4

${broadcastMessage}     Test broadcast message

##########User menu##########
${firstName}            nuitest6
${lastName}             testAutomate
${createUsername}       nuitest6
${createPassword}       password
${email}                automatetest@ekoapp.com

##########Commendation##########
${commendationName}     Test_Upload
${commendationRenamename}   Test_Rename