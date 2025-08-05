# JobGráfico - Sistema SaaS para Gráficas

JobGráfico é um sistema SaaS moderno e responsivo para gráficas e empresas de comunicação visual, oferecendo ferramentas para gerenciamento de tarefas, produção, estoque, finanças e logística.

## Características

- **Design Moderno**: Interface limpa e responsiva com paleta de cores profissional
- **Módulos Completos**: Dashboard, Tarefas, Produção (Kanban), Estoque, Chat, Finanças, Logística
- **Planos Flexíveis**: Opções Free e Pro para diferentes necessidades

## Tecnologias Utilizadas

- React
- Tailwind CSS
- React Router
- Chart.js
- React Icons
- Headless UI

## Instalação Local

```bash
# Instalar dependências
npm install

# Iniciar servidor de desenvolvimento
npm run dev

# Construir para produção
npm run build
```

## Deploy no Netlify

### Configurações para Netlify (Já Implementadas)

Este projeto já está configurado para deploy no Netlify com os seguintes arquivos:

- `netlify.toml` - Configuração principal do Netlify
- `public/_redirects` - Configuração de redirecionamento para SPA
- `public/_headers` - Otimizações de cache e segurança
- `public/robots.txt` - Configuração para crawlers
- `public/admin/` - Painel administrativo com Netlify CMS

### Método 1: Deploy via Interface do Netlify

1. Crie uma conta no [Netlify](https://www.netlify.com/)
2. Faça login e clique em "New site from Git"
3. Conecte sua conta GitHub, GitLab ou Bitbucket
4. Selecione o repositório do JobGráfico
5. Configure as opções de build:
   - Build command: `npm run build`
   - Publish directory: `dist`
6. Clique em "Deploy site"

### Método 2: Deploy via Netlify CLI

1. Instale o Netlify CLI globalmente:
   ```bash
   npm install netlify-cli -g
   ```

2. Faça login na sua conta Netlify:
   ```bash
   netlify login
   ```

3. Inicialize o projeto para o Netlify:
   ```bash
   netlify init
   ```

4. Siga as instruções para configurar o site

5. Para fazer deploy:
   ```bash
   netlify deploy --prod
   ```

### Método 3: Deploy via Script Automatizado (Windows)

Para usuários Windows, um script de deploy automatizado foi incluído:

1. Execute o arquivo `netlify-deploy.bat` com duplo clique
2. Siga as instruções na tela
3. O script irá:
   - Verificar se o Netlify CLI está instalado
   - Construir o projeto
   - Verificar arquivos de configuração
   - Realizar o deploy para o Netlify

## Configurações Importantes para o Netlify

O projeto já inclui as configurações necessárias para funcionar corretamente no Netlify:

1. **netlify.toml**: Configuração de build e redirecionamentos
2. **_redirects**: Garante que o React Router funcione corretamente
3. **_headers**: Otimiza cache e segurança
4. **base path no vite.config.js**: Configuração para o Vite

## Netlify CMS

O projeto inclui o Netlify CMS para gerenciamento de conteúdo. Para ativá-lo:

1. Após o deploy, acesse o painel do Netlify
2. Vá para **Site settings > Identity > Enable Identity**
3. Em **Registration preferences**, escolha **Invite only**
4. Em **Services > Git Gateway**, clique em **Enable Git Gateway**
5. Convide usuários administradores em **Identity > Invite users**

O painel administrativo estará disponível em `https://seu-site.netlify.app/admin/`

## Personalização

Você pode personalizar o sistema editando:

- **tailwind.config.js**: Para ajustar cores e fontes
- **src/components**: Para modificar componentes específicos
- **src/pages**: Para alterar páginas individuais

## Licença

Todos os direitos reservados © 2025 JobGráfico