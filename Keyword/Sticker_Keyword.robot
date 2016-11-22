*** Settings ***
Library    Selenium2Library
Resource    ../Properties.robot

*** Keywords ***
Upload sticker pack
    [Arguments]     ${stickerFileName}
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    Log     ${stickerCount}
    choose file     xpath=(//INPUT[@type='file'])[2]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/${stickerFileName}
    Sleep           5s
    ${newStickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    run keyword if  ${newStickerCount} != ${stickerCount}+1    fail    msg='Sticker pack doesn't uploaded'

Upload sticker
    [Arguments]     ${stickerFileName}
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    Log     ${stickerCount}
    choose file     xpath=(//INPUT[@type='file'])[3]    /Users/Supitchaya/PycharmProjects/WebAdminAutomate/Resource_File/${stickerFileName}
    Sleep           3s
    ${newStickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    run keyword if  ${newStickerCount} != ${stickerCount}+1    fail    msg='Sticker doesn't uploaded'

Select 1st sticker
    select checkbox     xpath=(//DIV[@class='sticker-box'])[1]/DIV/INPUT[@type='checkbox']

select all stickers
    select checkbox     xpath=//INPUT[@id='select_all_stickers']

Select last sticker pack
    ${stickerCount}=    Get matching xpath count   xpath=(//DIV[@class='sticker-box'])
    Log     ${stickerCount}
    select checkbox     xpath=(//DIV[@class='sticker-box'])[${stickerCount}]/DIV/INPUT[@type='checkbox']

Click on sticker name
    [Arguments]     ${stickerName}
    click link      ${stickerName}

Click remove selected stickers button
    click element       xpath=//SPAN[@class='label-text'][text()='Remove selected stickers']
    click button        Delete

Click remove selected sticker packs button
    click element       xpath=//SPAN[@class='label-text'][text()='Remove selected sticker packs']
    click button        Delete

Input new sticker pack name
    [Arguments]     ${newStickerName}
    input text      xpath=//INPUT[@id='stickerPackName']    ${newStickerName}
    sleep           3s