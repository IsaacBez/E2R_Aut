*** Settings ***
Library  AppiumLibrary

*** Variables ***

#Configuração para plataforma Android 
${APP_PACKAGE}                         br.com.eletra.e2r.test
${APP_ACTIVITY}                        br.com.eletra.e2r.test.MainActivity
${APPIUM_SERVER_URL}                   http://localhost:4723
${WAIT_FOR_ANDROID_ACTIVITY}           2s


*** Keywords ***
Open app android
    Open Application    
    ...    ${APPIUM_SERVER_URL}    
    ...    platformName=Android
    ...    automationName=UiAutomator2   
    ...    appPackage=${APP_PACKAGE}    
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    ...    fullReset=false
    Sleep  2s

Close app
     Close Application