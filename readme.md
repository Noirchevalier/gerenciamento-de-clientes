# 🧑‍💼 Gerenciamento de Clientes (Backend Go)

Sistema de gerenciamento de clientes desenvolvido em **Go**, utilizando **Docker** para infraestrutura e seguindo os princípios de **DDD (Domain Driven Design)**.

---

## 🛠️ Pré-requisitos

Antes de começar, instale as ferramentas abaixo:

1.  **[Go 1.22+](https://go.dev/dl/)**: Linguagem principal.
2.  **[Docker Desktop](https://www.docker.com/products/docker-desktop/)**: Para rodar o banco de dados Postgres.
3.  **[DBeaver](https://dbeaver.io/download/)**: Para visualizar as tabelas.
4.  **[SQLC](https://docs.sqlc.dev/en/latest/overview/install.html)**: Para gerar código Go a partir de SQL.
    * No Windows: `go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest`
5.  **[Goose](https://github.com/pressly/goose)**: Para rodar as migrações (tabelas e sementes).
    * No Windows: `go install github.com/pressly/goose/v3/cmd/goose@latest`

---

## ⚙️ Configuração do Ambiente (Primeira Execução)

### 1️⃣ Configurar SSH para o GitHub

No terminal, execute:

```bash
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
Pressione Enter em todas as perguntas.

Depois, copie sua chave pública:

Bash
cat ~/.ssh/id_ed25519.pub
Cole no GitHub em:
Settings > SSH and GPG keys > New SSH Key

2️⃣ Clonar o Repositório
Bash
git clone git@github.com:Noirchevalier/gerenciamento-de-clientes.git
cd gerenciamento-de-clientes
3️⃣ Subir o Banco de Dados (Docker)
Certifique-se de que o Docker Desktop está aberto.

No diretório do projeto, execute:

Bash
docker compose up -d
Isso irá baixar e iniciar o PostgreSQL automaticamente.

🚀 Executando a Aplicação
1️⃣ Gerar código do banco e Migrations
Antes de rodar a API, certifique-se de que o código do banco está atualizado e as dependências instaladas:

Bash
sqlc generate
go mod tidy
2️⃣ Iniciar o servidor
Bash
go run cmd/api/main.go
As migrations (criação de tabelas e seeds) serão executadas automaticamente pelo Goose na inicialização do sistema.

3️⃣ Verificar se está funcionando
No terminal, deve aparecer:
Conexão com o Postgres estabelecida com sucesso!

No navegador, acesse:
http://localhost:8080/health

Resposta esperada:
Servidor Online

🗄️ Acessando o Banco de Dados (DBeaver)
Utilize as seguintes configurações para conectar ao Postgres:

Host: localhost
Porta: 5432
Database: orders_db
Usuário: user
Senha: password123

📂 Estrutura do Projeto (DDD)
Plaintext
cmd/
 └── api/
     └── main.go          # Ponto de entrada da aplicação

internal/
 ├── domain/              # Entidades e regras de negócio
 └── infra/               # Implementações técnicas
      ├── database/       # Código Go gerado automaticamente pelo SQLC
      └── http/           # Handlers, rotas e middlewares

sql/
 ├── schema/              # Migrations (Goose) - Arquivos .sql de estrutura e seeds
 └── queries/             # Queries SQL brutas que o SQLC usa para gerar código Go
🛠️ Workflow de Banco de Dados
Criar nova tabela: Adicione um arquivo .sql em sql/schema/ seguindo a numeração (ex: 003_create_orders.sql).

Criar nova Query: Adicione o SQL desejado em sql/queries/customers.sql e execute o comando sqlc generate.

Desfazer Migração (Rollback): goose -dir sql/schema postgres "postgres://user:password123@localhost:5432/orders_db?sslmode=disable" down

💡 Dicas Úteis
Se os comandos go, git, sqlc ou docker não forem reconhecidos:

Reinicie o terminal.

Ou reinicie o VS Code.

Verifique se o diretório $GOPATH/bin (ou %USERPROFILE%\go\bin no Windows) está no seu PATH do sistema.