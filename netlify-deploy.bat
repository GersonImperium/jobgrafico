@echo off
echo ===== JobGrafico - Deploy para Netlify =====
echo.

REM Verificar se o Netlify CLI está instalado
where netlify >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Netlify CLI nao encontrado. Instalando...
    npm install netlify-cli -g
    if %ERRORLEVEL% neq 0 (
        echo Falha ao instalar Netlify CLI. Por favor, instale manualmente.
        exit /b 1
    )
)

echo.
echo 1. Construindo o projeto...
echo.

npm run build
if %ERRORLEVEL% neq 0 (
    echo Falha na construcao do projeto.
    exit /b 1
)

echo.
echo 2. Verificando arquivos de configuracao...
echo.

REM Garantir que o _redirects está na pasta de build
if not exist "dist\_redirects" (
    echo /* /index.html 200 > dist\_redirects
    echo Arquivo _redirects criado.
)

REM Garantir que o robots.txt está na pasta de build
if not exist "dist\robots.txt" (
    if exist "public\robots.txt" (
        copy "public\robots.txt" "dist\robots.txt" > nul
    ) else (
        echo User-agent: * > dist\robots.txt
        echo Allow: / >> dist\robots.txt
    )
    echo Arquivo robots.txt copiado/criado.
)

REM Garantir que o _headers está na pasta de build
if exist "public\_headers" (
    if not exist "dist\_headers" (
        copy "public\_headers" "dist\_headers" > nul
        echo Arquivo _headers copiado.
    )
)

REM Copiar pasta admin se existir
if exist "public\admin" (
    if not exist "dist\admin" (
        mkdir "dist\admin" 2> nul
        xcopy "public\admin\*" "dist\admin\" /E /I /Y > nul
        echo Pasta admin copiada.
    )
)

echo.
echo 3. Iniciando deploy para o Netlify...
echo.

REM Verificar se o usuário já está logado no Netlify
netlify status > nul 2> nul
if %ERRORLEVEL% neq 0 (
    echo Voce precisa fazer login no Netlify primeiro.
    netlify login
    if %ERRORLEVEL% neq 0 (
        echo Falha ao fazer login no Netlify.
        exit /b 1
    )
)

REM Perguntar se é o primeiro deploy ou não
set /p FIRST_DEPLOY=E o primeiro deploy deste site? (S/N): 

if /i "%FIRST_DEPLOY%"=="S" (
    echo Iniciando configuracao inicial do site...
    netlify init
) else (
    echo Realizando deploy do site...
    netlify deploy --prod
)

echo.
echo Deploy concluido com sucesso!
echo.

pause