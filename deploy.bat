@echo off
cd /d "%~dp0"

echo 🔄 Renderizando sitio con Quarto...
quarto render --output-dir docs
IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Error al renderizar con Quarto. Abortando.
    pause
    exit /b %ERRORLEVEL%
)

REM Comprobamos si hay cambios sin guardar
git diff --quiet
IF ERRORLEVEL 1 (
    echo 💾 Cambios detectados. Haciendo commit temporal...
    git add .
    git commit -m "Auto-commit before pull (render update)"
)

echo 🔃 Haciendo pull con rebase...
git pull --rebase origin main

echo 📤 Añadiendo últimos cambios...
git add .

set /p COMMIT_MSG=Introduce un mensaje para el commit final: 
git commit -m "%COMMIT_MSG%"
git push origin main

echo 🟢 Publicación completada.
pause
