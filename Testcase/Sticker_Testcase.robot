*** Settings ***
Library    Selenium2Library
Resource   ../Keyword/Sticker_Keyword.robot
Resource  ../Keyword/Common_Keyword.robot

*** Test Cases ***
Add new sticker pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Upload sticker pack        Commendations.zip
    [Teardown]  close browser

Add more sticker in pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Click on sticker name           Commendations
    Upload sticker                  burger.png
    [Teardown]  close browser

Remove sticker in pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Click on sticker name           Commendations
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    Log     ${stickerCount}
    Select 1st sticker
    Click remove selected stickers button
    ${newStickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    run keyword if  ${newStickerCount} != ${stickerCount}-1    fail    msg='Sticker doesn't removed'
    [Teardown]  close browser

Remove all stickers in pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Click on sticker name           Commendations
    select all stickers
    Click remove selected stickers button
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    pass execution if   ${stickerCount} == 0    msg='All sticers in pack has been deleted'
    [Teardown]  close browser

Rename sticker pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Click on sticker name           Commendations
    Input new sticker pack name     S1
    Click sticker packs menu
    Click on sticker name           S1
    [Teardown]  close browser

Remove sticker pack
    Login web admin     ${mainUsername}    ${mainPassword}
    Click sticker packs menu
    Select last sticker pack
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    Log     ${stickerCount}
    Click remove selected sticker packs button
    ${newStickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    run keyword if  ${newStickerCount} != ${stickerCount}-1    fail    msg='Sticker pack doesn't removed'
    [Teardown]  close browser

[teardown]  Close Browser