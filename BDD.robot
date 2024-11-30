*** Settings ***
Library   SeleniumLibrary

*** Variables ***
#Dados de Teste
${NomeDaMusica}    lil peep nineteen

#variaveis de configurações
${URL}      https://www.youtube.com/
${Browser}  chrome

#Elementos
${InpuPesquisa}     //*[@name="search_query"]
${Buttonpesquisa}  //*[@id="search-icon-legacy"]
${Primeiro}        (//*[@id="video-title"])[1]
${Prova}           (//*[@id="video-title"])[1]


*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser   ${URL}   ${Browser}

Quando digito o nome da musica
    Click Element   xpath=${InpuPesquisa}
    Input Text   xpath=${InpuPesquisa}  ${NomeDaMusica}

E clico no butão buscar
    Wait Until Element Is Visible    xpath=${Buttonpesquisa}
    Click Button   xpath=${Buttonpesquisa}   

E clico na primiera opção da lista
    Wait Until Element Is Visible  xpath=${Primeiro}   
    Click Element   xpath=${Primeiro}

Então o vídeio é executado
    Element Should Be Visible   xpath=${Prova}
    #Sleep 1s
    Close Browser



*** Test Cases ***
Cenário 1: Executrar vídeio no site do youtube 
    Dado que eu acesso o site do youtube
    Quando digito o nome da musica
    E clico no butão buscar
    E clico na primiera opção da lista
    Então o vídeio é executado 
