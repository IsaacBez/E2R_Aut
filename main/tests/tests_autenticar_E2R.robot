*** Settings ***
Resource            ../resources/resources_comum.robot
Resource            ../resources/Autenticacao/resources_autenticar_E2R.robot
Test Setup          Open app android
Test Teardown       Close app


*** Test Cases ***

CT_001 - Verificar Visibilidade dos elementos da tela login
    [Tags]     Visibilidade
    Given Que estou na tela de autenticação
    Then O componente ${CAMPO_USUARIO} fica visivel
    And O componente ${CAMPO_SENHA} fica visivel
    And O componente ${BT_LOGIN} fica visivel
    And O componente ${BT_VISUALIZAR_SENHA} fica visivel
    And O componente ${LINK_RECUPERAR_SENHA} fica visivel
    And O componente ${LINK_CRIAR_CONTA} fica visivel

CT_002 - Teste o campo E-mail vazio
    [Tags]     Teste valor vazio
    Given Que estou na tela de autenticação
    And Preencho os campos com valores validos 
    When Defino ${CAMPO_USUARIO} vazio
    And Clico em ${BT_LOGIN}
    Then Aparece o erro vazio ${MENS_ERRO_EMAIL_OBRIGATORIO}        

CT_003 - Teste o campo Senha vazio
    [Tags]     Teste valor vazio
    Given Que estou na tela de autenticação
    And Preencho os campos com valores validos 
    When Defino ${CAMPO_SENHA} vazio
    And Clico em ${BT_LOGIN}
    Then Aparece o erro vazio ${MENS_ERRO_SENHA_OBRIGATORIO}        

CT_004 - Teste o campo E-mail e Senha vazio    
    [Tags]     Teste valor vazio
    Given Que estou na tela de autenticação
    And Preencho os campos com valores validos 
    When Defino ${CAMPO_USUARIO} vazio
    And Defino ${CAMPO_SENHA} vazio
    And Clico em ${BT_LOGIN}
    Then Aparece o erro vazio ${MENS_ERRO_EMAIL_OBRIGATORIO} 
    And Aparece o erro vazio ${MENS_ERRO_SENHA_OBRIGATORIO2}


#CT - Esqueci minha senha
#CT - Realizar Logout
#CT - Realizar Login com Email em formato incorreto 
#CT - Realizar Login com Email em formato não cadastrado
#CT - Realizar Login com Senha em incorreto