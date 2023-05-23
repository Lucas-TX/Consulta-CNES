# Consulta CNES
> Esse projeto consulta e extrai dados do Cadastro Nacional de Estabelecimentos de Saúde (CNES) usando *Robot Framework*


## Requisitos
* *Selenium Library*
* *CSV Library*
* *OperatingSystem Library*

## Layout

- ***Source***: Pasta raiz do código fonte
-***Input***: Contém o arquivo de dados usado nos testes
- ***Libraries***: Contém bibliotecas personalizadas
- ***Resources***: Contém recursos utilizados nos testes e configurações.
  - **PO**: Contém os casos de teste em arquivos .robot.
    - **Pagina_Consulta.robot**: Contém os seletores e as ações realizadas na página de consulta
    - **Pagina_Identificação.robot**: Contém os seletores e as ações realizadas na página de Identificação
    - **Pagina_Impressão.robot**: Contém os seletores e as ações realizadas na página de Impressão
    - **Pagina_Resultados.robot**: Contém os seletores e as ações realizadas na página de resultados
  - **Comum.robot**: Contém ações usadas no *Setup* e *Teardown*
  - **Consulta_App.robot**: Organiza as principais Keywords do processo
  - **CSV.robot**: Contém ações usadas ao ler o arquivo .csv
  - **OS.robot**: Contém ações usadas para manipulação de arquivos
- ***Results***: Pasta onde são armazenados os resultados dos testes, como logs, relatórios e capturas de tela.
  - **Output**: Pasta onde as fichas baixadas devem ser salvas
- ***Tests***: Contém o *script* principal usado nos testes
- ***.gitignore***: Contém pastas não sincronizadas com o git
- **Cenários de teste**: Contém um resumo dos cenários de teste previstos
- ***README.md***

## Para executar

* Para executar o código principal e salvar os resultados na pasta "Results".
Utilize o comando abaixo:
```
robot -d Results Tests/Consulta_CNES.robot
```

## Decisões tomadas
* Para leitura do CSV, a biblioteca CSVLibrary foi escolhida
* Por algum motivo, as keywords definidas no arquivo "Leitura_CSV.robot" não funcionam no arquivo Consulta_CNES.robot 
* Para manipular os arquivos baixados, a biblioteca OperatingSystem foi escolhida
* para interações com o *browser*, a biblioteca Selenium foi escolhida
* Não consegui usar a biblioteca RPA.tasks. Então, não consegui definir a tempo uma outra estratégia para usar loops 

