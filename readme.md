# 🧑‍💼 Gerenciamento de Clientes (Backend Go)

Sistema de gerenciamento de clientes desenvolvido em **Go**, utilizando **Docker** para infraestrutura e seguindo os princípios de **DDD (Domain Driven Design)**.

---

## 🛠️ Pré-requisitos

Antes de começar, instale as ferramentas abaixo:

- **Go 1.22+**  
  https://go.dev/dl/

- **Docker Desktop**  
  https://www.docker.com/products/docker-desktop/

- **DBeaver**  
  https://dbeaver.io/download/

---

## ⚙️ Configuração do Ambiente (Primeira Execução)

### 1️⃣ Configurar SSH para o GitHub

No terminal, execute:

```bash
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
Pressione Enter em todas as perguntas.

Depois, copie sua chave pública:

cat ~/.ssh/id_ed25519.pub
Cole no GitHub em:
Settings > SSH and GPG keys > New SSH Key

2️⃣ Clonar o Repositório
git clone git@github.com:Noirchevalier/gerenciamento-de-clientes.git
cd gerenciamento-de-clientes
3️⃣ Subir o Banco de Dados (Docker)
Certifique-se de que o Docker Desktop está aberto.

No diretório do projeto, execute:

docker compose up -d
Isso irá baixar e iniciar o PostgreSQL automaticamente.

🚀 Executando a Aplicação
1️⃣ Instalar dependências e iniciar o servidor
go mod tidy
go run cmd/api/main.go
2️⃣ Verificar se está funcionando

No terminal, deve aparecer:
Conexão com o Postgres estabelecida com sucesso!

No navegador, acesse:
http://localhost:8080/health
Resposta esperada:
Servidor Online

🗄️ Acessando o Banco de Dados (DBeaver)
Utilize as seguintes configurações:
Host: localhost
Porta: 5432
Database: orders_db
Usuário: user
Senha: password123

📂 Estrutura do Projeto (DDD)
cmd/
 └── api/
     └── main.go          # Ponto de entrada da aplicação

internal/
 ├── domain/              # Entidades e regras de negócio
 └── infra/               # Banco de dados, rotas e implementações técnicas

sql/
 └── schema/              # Scripts SQL para criação das tabelas
💡 Dicas Úteis
Se os comandos go, git ou docker não forem reconhecidos:
Reinicie o terminal
Ou reinicie o VS Code