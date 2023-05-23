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
    - **Pagina_Consulta.robot**:
    - **Pagina_Identificação.robot**:
    - **Pagina_Impressão.robot**:
    - **Pagina_Resultados.robot**:
  - **Comum.robot**:
  - **Consulta_App.robot**:
  - **CSV.robot**:
  - **OS.robot**:
- ***Results***: Pasta onde são armazenados os resultados dos testes, como logs, relatórios e capturas de tela.
  - **Output**
- ***Tests***: Contém o *script* principal usado nos testes
- ***.gitignore***
- **Cenários de teste**
- ***README.md***




## Para executar

* Para executar o código principal e salvar os resultados na pasta "Results".
Utilize o comando abaixo:
```
robot -d Results Tests/Consulta_CNES.robot
```

## Decisões tomadas
* Para leitura do CSV, a biblioteca CSVLibrary foi escolhida
* Para manipular os arquivos baixados, a biblioteca OperatingSystem foi escolhida
* para interações com o *browser*, a biblioteca Selenium foi escolhida
* 

