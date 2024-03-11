# Notes-API

## Dependências

- Ruby v3.2.3
- Rails v7.1.3.2
- MySQL v8.3.0
- Postman (https://documenter.getpostman.com/view/8120581/2sA2xh4De8)


## Setup do Projeto

### **1. Download**

Acesse via terminal o local dos seus projetos e faça o download do repositório com o seguinte comando:

```bash
git clone git@github.com:NatthanBispo/notes-api.git
```

### **2. Instalar**
Com a versão correta do ruby, basta executar:

```bash
gem install bundle && bundle install
```

### **3. Configurar Conexão com Banco de Dados**
Execute o comando abaixo para criar o arquivo `config/database.yml`, sendo uma cópia do `config/database.example.yml`. Depois de executado va no arquivo `config/database.yml` e altere o usuario e senha para os ja pré configurados no seu computador.

```bash
cp config/database{.example.yml,.yml}
```

### **4. Criar Banco de dados**

Por fim, crie o banco de dados, rode as migrations e gere os seeds

```bash
rails db:create db:migrate
```

## Testes
Utilizamos o Cucumber para execução de testes.

Para executar manualmente basta executar:

```bash
cucumber
```

Ou se preferir executar um arquivo especifco por exemplo:

```bash
cucumber features/notes/create.feature
```