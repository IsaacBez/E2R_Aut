*** Settings ***
Library      AppiumLibrary
Resource     ../resources_comum.robot


*** Variables ***

${LOGO_ELETRA}                         //android.widget.ImageView
${TITULO_TELA_LOGIN}                   //android.view.View[@content-desc="Login"]
${CAMPO_USUARIO}                       //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]                       
${CAMPO_SENHA}                         //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]
${BT_LOGIN}                            //android.widget.Button[@content-desc="Login"]
${BT_VISUALIZAR_SENHA}                 //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]/android.widget.Button
${LINK_RECUPERAR_SENHA}                //android.view.View[@content-desc="Forgot password?"]
${LINK_CRIAR_CONTA}                    //android.widget.Button[@content-desc="Create account"]
${MENS_ERRO_EMAIL_OBRIGATORIO}         //android.view.View[@content-desc="Required field."][1]
${MENS_ERRO_SENHA_OBRIGATORIO}         //android.view.View[@content-desc="Required field."]
${MENS_ERRO_SENHA_OBRIGATORIO2}        xpath=(//android.view.View[@content-desc="Required field."])[2]
${LINGUAGEM}                           {//android.widget....}
${BT_PERMISSAO_USO_APP}                {//android.widget....}
${BT_PERMISSAO_ESTA_VEZ}               xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_one_time_button"]      
${BT_PERMISSAO_NAO_PERMITIR}           {//android.widget....}



*** Keywords ***

Que estou na tela de autenticação
    Wait Until Element Is Visible    ${BT_LOGIN}
    Element Should Be Visible        ${LOGO_ELETRA}
    Element Should Be Visible        ${TITULO_TELA_LOGIN}

O componente ${COMPONENTE} fica visivel
    Wait Until Element Is Visible    ${COMPONENTE}

Preencho os campos com valores validos
  Wait Until Element Is Visible      ${CAMPO_USUARIO}
    Click Element                    ${CAMPO_USUARIO}
    Input Text                       ${CAMPO_USUARIO}        isaac.bez.oliveira@gmail.com
    
    Wait Until Element Is Visible    ${CAMPO_SENHA}
    Click Element                    ${CAMPO_SENHA}
    Input Text                       ${CAMPO_SENHA}          61qLKgnS
    
Defino ${COMPONENTE} vazio
    Clico em ${COMPONENTE}
    Input Text       ${COMPONENTE}    ${SPACE}
    Clear Text       ${COMPONENTE}


Clico em ${COMPONENTE}
    Click Element    ${COMPONENTE}


Aparece o erro vazio ${COMPONENTE}
     Element Attribute Should Match    
     ...                     ${COMPONENTE}
     ...                     content-desc
     ...                     Required field.

Autenticar no Sistema
    
    Wait Until Element Is Visible    ${CAMPO_USUARIO}
    Click Element                    ${CAMPO_USUARIO}
    Input Text                       ${CAMPO_USUARIO}        isaac.bez.oliveira@gmail.com
    
    Wait Until Element Is Visible    ${CAMPO_SENHA}
    Click Element                    ${CAMPO_SENHA}
    Input Text                       ${CAMPO_SENHA}          61qLKgnS
    
    
    Click Element                    ${BT_LOGIN}
    
    Click Element                    ${BT_PERMISSAO_ESTA_VEZ}    

Sair da conta
    Sleep    5s
    Click Element At Coordinates    944    2241
    Sleep   5s
    Click Element    //android.view.View[@content-desc="Logout"]
    Element Should Be Enabled    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View
    Click Element    //android.widget.Button[@content-desc="Confirm"]
    Sleep    3s
    Element Should Be Visible    //android.view.View[@content-desc="Login"]
