#!/bin/bash

# Script de build personalizado para o Netlify

echo "🚀 Iniciando build do JobGráfico para o Netlify..."

# Instalar dependências
echo "📦 Instalando dependências..."
npm install

# Construir o projeto
echo "🔨 Construindo o projeto..."
npm run build

# Copiar arquivos importantes para a pasta de build
echo "📋 Copiando arquivos de configuração..."

# Garantir que o _redirects está na pasta de build
if [ ! -f "dist/_redirects" ]; then
  echo "/* /index.html 200" > dist/_redirects
  echo "✅ Arquivo _redirects criado"
fi

# Garantir que o robots.txt está na pasta de build
if [ ! -f "dist/robots.txt" ]; then
  cp public/robots.txt dist/ 2>/dev/null || echo "User-agent: *\nAllow: /" > dist/robots.txt
  echo "✅ Arquivo robots.txt copiado/criado"
fi

# Garantir que o _headers está na pasta de build
if [ ! -f "dist/_headers" ]; then
  cp public/_headers dist/ 2>/dev/null
  echo "✅ Arquivo _headers copiado"
fi

# Copiar pasta admin se existir
if [ -d "public/admin" ] && [ ! -d "dist/admin" ]; then
  mkdir -p dist/admin
  cp -r public/admin/* dist/admin/
  echo "✅ Pasta admin copiada"
fi

echo "✨ Build concluído com sucesso!"