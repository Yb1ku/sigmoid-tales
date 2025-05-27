@echo off
cd /d "%~dp0"

echo Limpiando y renderizando el sitio completo con Quarto...
quarto render --output-dir docs

IF %ERRORLEVEL% NEQ 0 (
    echo ❌ ERROR: Fallo al renderizar con Quarto. Abortando.
    pause
    exit /b %ERRORLEVEL%
)

echo Sitio renderizado correctamente.

echo Haciendo pull con rebase...
git pull origin main --rebase

echo Añadiendo archivos modificados...
git add .

set /p COMMIT_MSG=Introduce un mensaje para el commit: 
git commit -m "%COMMIT_MSG%"
git push origin main

echo Publicacion completada. Tu web esta actualizada en GitHub Pages.
pause