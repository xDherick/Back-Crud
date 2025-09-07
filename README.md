# API de Gerenciamento de Tarefas (Back-end)

Esta é a API RESTful para o projeto "Meu Condomínio" de gerenciamento de tarefas. Construída com Ruby on Rails, ela serve como a espinha dorsal para a aplicação, gerenciando toda a lógica de negócios e a persistência de dados.

A API foi publicada e está online no Render. Você pode visualizar todas as tarefas e verificar se está online em: 

https://back-crud-8t75.onrender.com/tasks

Integrações em tempo real no frontend Angular hospedado em vercel:

https://meu-condominio-xdhericks-projects.vercel.app

## ✨ Funcionalidades

- **CRUD completo para Tarefas:** Criar, Ler, Atualizar e Deletar tarefas.
- **CRUD para Comentários:** Criar e Deletar comentários aninhados a cada tarefa.
- **Associações:** Relacionamento um-para-muitos entre Tarefas e Comentários.
- **Comunicação em tempo real:** Configurada com Action Cable para transmitir alterações (embora desativada na versão final do deploy por instabilidade da plataforma).

## 🛠️ Tecnologias Utilizadas

- **Ruby on Rails 8:** Framework principal do back-end.
- **PostgreSQL:** Banco de dados relacional para persistência de dados.
- **Puma:** Servidor web para rodar a aplicação Rails.
- **Rack CORS:** Middleware para gerenciar permissões de acesso Cross-Origin.
- **Action Cable:** Framework para comunicação em tempo real via WebSockets.

## 🚀 Como Rodar Localmente

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/xDherick/Back-Crud.git](https://github.com/xDherick/Back-Crud.git)
    cd Back-Crud
    ```

2.  **Instale as dependências:**
    ```bash
    bundle install
    ```

3.  **Crie e configure o banco de dados:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4.  **Inicie o servidor:**
    ```bash
    rails s
    ```

A API estará disponível em `http://localhost:3000`.

## 🔗 Endpoints Principais

- `GET /tasks` - Retorna a lista de todas as tarefas.
- `POST /tasks` - Cria uma nova tarefa.
- `PUT /tasks/:id` - Atualiza uma tarefa existente.
- `DELETE /tasks/:id` - Deleta uma tarefa.
- `POST /tasks/:task_id/comments` - Cria um novo comentário para uma tarefa.
- `DELETE /tasks/:task_id/comments/:id` - Deleta um comentário.
